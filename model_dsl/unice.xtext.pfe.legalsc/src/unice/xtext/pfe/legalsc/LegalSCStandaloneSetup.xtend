/*
 * generated by Xtext 2.17.0
 */
package unice.xtext.pfe.legalsc


/**
 * Initialization support for running Xtext languages without Equinox extension registry.
 */
class LegalSCStandaloneSetup extends LegalSCStandaloneSetupGenerated {

	def static void doSetup() {
		new LegalSCStandaloneSetup().createInjectorAndDoEMFRegistration()
	}
}
