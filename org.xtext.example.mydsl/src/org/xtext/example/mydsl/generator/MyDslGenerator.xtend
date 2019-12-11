/*
 * generated by Xtext 2.17.0
 */
package org.xtext.example.mydsl.generator

import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.xtext.generator.AbstractGenerator
import org.eclipse.xtext.generator.IFileSystemAccess2
import org.eclipse.xtext.generator.IGeneratorContext
import LegalSC.Contrat
import LegalSC.Entete
import LegalSC.ClauseSection
import LegalSC.Clause
import LegalSC.Variable
import LegalSC.Partie
import LegalSC.Execution
import LegalSC.Droit
import LegalSC.Executable
import LegalSC.SiAlors
import LegalSC.Expression
import LegalSC.Condition

/**
 * Generates code from your model files on save.
 * 
 * See https://www.eclipse.org/Xtext/documentation/303_runtime_concepts.html#code-generation
 */
class MyDslGenerator extends AbstractGenerator {
		

	override void doGenerate(Resource resource, IFileSystemAccess2 fsa, IGeneratorContext context) {

		val c = resource.allContents.toIterable.filter(Contrat).get(0)
		fsa.generateFile(
			c.nom + ".sol",
			c.compile)
		}
	
	def compile(Contrat c) '''
		«»
		contrat «c.nom» {
			«c.entete.compile»
			
			«generateValidators()»
			
			constructor(string memory _pdfHash) public {
				pdfHash = _pdfHash;
				reactivate_will[recipient] = false;
				reactivate_will[client] = false;
			}
		
			«FOR s : c.clausesection»
				«s.compile»
			«ENDFOR»
		}
	'''
	
	
	def compile(Entete e) '''
		bool private active = true;
		string private pdfHash ;
		uint private date_debut = «e.date_debut» ;
		«FOR p : e.partie»
			«p.compile»
		«ENDFOR»
		«FOR v : e.variable»
			«v.compile»
		«ENDFOR»
	'''
	
	def compile(Partie p)'''
		address private «p.role» = «p.adresse» ;
	'''
	
	def compile(Variable v) '''
		«IF v.type==='date'»
			uint private «v.nom» «IF v.date!==null»= «v.date» «ENDIF»;
		«ENDIF»
		«IF v.type==='nombre'»
			uint private «v.nom» = «v.nombre» ;
		«ENDIF»
		«IF v.type==='adresse'»
			address private «v.nom» «IF v.adresse!==null»= «v.adresse» «ENDIF»;
		«ENDIF»
	'''
	
	def compile(ClauseSection s) '''
		«FOR c : s.clause»
			«c.compile»
		«ENDFOR»
	'''
	
	def compile(Clause c) '''
		bool active_«c.nom» = true ;
		«c.execution.compile(c.nom)»
	'''
	
	def compile(Execution e, String name) '''
		«e.droit.precompile(name, e.operateurLogique)»
		function «name»() public «e.droit.compile(name, e.operateurLogique)» isActive{
			require(active_«name») ;
			«FOR exec : e.executable»
				«exec.compile»
			«ENDFOR»
		}
	'''
	
	def compile(Executable e) '''
		«IF e instanceof SiAlors»
			«(e.compileSiAlors)»
		«ENDIF»
		«IF e instanceof Expression»
			«e.compileExpression»
		«ENDIF»	
	'''
	
	def compileSiAlors(SiAlors sa) '''
		«»
		if («sa.condition.compile») {
			«FOR e : sa.executable»
			«e.compile»
			«ENDFOR»
		}
	'''
	
	def compile(Condition c) '''
		«c.condition».passed()
	'''
	
	def compileExpression(Expression e) '''
		expression
	'''
	
	def precompile(Droit[] d, String name, String operator)'''
		address «name»_rule = [«d.get(0).parties» «FOR p : d.subList(1,d.size())», «p.parties»«ENDFOR»];
		
		«IF operator==='et'»
			mapping(address => bool) public «name»_state;
		«ENDIF»
	'''
	
	def compile(Droit[] d, String name, String operator)'''
		«IF operator==='et'»
			andValidator(«name», «name»_rule)
		«ELSE»
			orValidator(«name»_rule)
		«ENDIF»
	'''
	
	def generateValidators() '''
		modifier isActive {
					require(active);
					_;
				}
				
				modifier isInactive {
					require(!active);
					_;
				}
				modifier orValidator(address[] storage parties) {
					for(uint i = 0; i < parties.length; ++i) {
						if(msg.sender == parties[i]) {
							_;
							return;
						}
					}
					revert();
				}
				modifier andValidator(mapping(address => bool) storage _registre, address[] storage parties) {
					for(uint i = 0; i < parties.length; ++i) {
						if(msg.sender == parties[i]) {
							_registre[parties[i]] = true;
							break;
						}
					}
				
					for(uint i = 0; i < parties.length; ++i) {
						if(_registre[parties[i]] == false) {
							return;
						}
					}
				
					for(uint i = 0; i < parties.length; ++i) {
						_registre[parties[i]] = false;
					} 
				
					_;
				}
	'''
}
