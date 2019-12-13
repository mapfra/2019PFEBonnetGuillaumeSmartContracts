package unice.xtext.pfe.legalsc.generator

import org.eclipse.emf.ecore.resource.Resource
import LegalSC.Contrat
import org.eclipse.xtext.generator.IFileSystemAccess2
import LegalSC.Entete

class PdfGenerator {
	def public static void pdfGenerate(Resource resource, IFileSystemAccess2 fsa){
		val c = resource.allContents.toIterable.filter(Contrat).get(0)
		fsa.generateFile(
			c.nom.toFirstUpper + ".tex",
			c.compile)
	}
	
	def static compile(Contrat c) '''
		\documentclass{article}
				\usepackage[utf8]{inputenc}
				\usepackage{xcolor}
				
				\title{Contrat de prestation de service}
				
				\begin{document}
				
				\maketitle
				
				\title{Entre les soussignés}
				\\
				
				«c.entete.compile»
				
				\section{Dispositions générales}
				\subsection{Acceptation des conditions générales}
				Le client déclare avoir pris connaissance des conditions générales de prestations de services et les avoir acceptées sans réserve avant de passer commande en retournant le devis ou l'offre faite par le prestataire.
				
				\subsection{Objet}
				Le prestataire met au service du client une technologie A DEFINIR
				
				\subsection{Domaine d'application}
				Les présentes conditions générales déterminent les conditions contractuelles applicables à la fourniture des prestations de services proposées par le prestataire à ses clients consommateurs ou non-professionnels.
				
				\subsection{Dispositions contractuelles}
				La nullité d'une clause contractuelle n'entraîne pas la nullité des conditions générales de prestation de services sauf s'il s'agit d'une clause impulsive et déterminante ayant amené l'une des parties à conclure le contrat de vente
				
				
				\subsection{Modification des conditions générales}
				Les conditions générales applicables sont celles en vigueur à la date de la commande passée par le consommateur. Les modifications des conditions générales seront applicables aux contrats en cours à la condition que le client dûment averti n'ait pas exprimé son désaccord dans un délai déterminé.
				
				\section{Informations précontractuelles}
				
				\textbf{\color{blue} Article R. 111-1} \\
				Pour l'application des 4º, 5º et 6º de l'article {\color{blue}L. 111-1}, le professionnel communique au consommateur les informations suivantes :
				1º Son nom ou sa dénomination sociale, l'adresse géographique de son établissement et, si elle est différente, celle du siège social, son numéro de téléphone et son adresse électronique ;\\
				2º Les modalités de paiement, de livraison et d'exécution du contrat ainsi que celles prévues par le professionnel pour le traitement des réclamations ;\\
				3º S'il y a lieu, l'existence et les modalités d'exercice de la garantie légale de conformité mentionnée aux articles {\color{blue}L. 217-4 à L. 217-13} et de celle des défauts de la chose vendue dans les conditions prévues aux articles 1641 à 1648 et 2232 du code civil ainsi que, le cas échéant, de la garantie commerciale et du service après-vente mentionnés respectivement aux articles {\color{blue}L. 217-15 et L. 217-17} ;
				4º S'il y a lieu, la durée du contrat ou, s'il s'agit d'un contrat à durée indéterminée ou à tacite reconduction, les conditions de sa résiliation ;\\
				5º S'il y a lieu, toute interopérabilité pertinente du contenu numérique avec certains matériels ou logiciels dont le professionnel a ou devrait raisonnablement avoir connaissance ainsi que les fonctionnalités du contenu numérique, y compris les mesures de protection technique applicables ;\\
				6º Les coordonnées du ou des médiateurs de la consommation compétents dont il relève en application de l'article {\color{blue}L. 616-1}.
				
				
				\textbf{\color{blue} Article L111-1} \\
				Avant que le consommateur ne soit lié par un contrat de vente de biens ou de fourniture de services, le professionnel communique au consommateur, de manière lisible et compréhensible, les informations suivantes :\\
				1° Les caractéristiques essentielles du bien ou du service, compte tenu du support de communication utilisé et du bien ou service concerné ;\\
				2° Le prix du bien ou du service, en application des articles {\color{blue}L. 112-1 à L. 112-4} ;\\
				3° En l'absence d'exécution immédiate du contrat, la date ou le délai auquel le professionnel s'engage à livrer le bien ou à exécuter le service ;\\
				4° Les informations relatives à son identité, à ses coordonnées postales, téléphoniques et électroniques et à ses activités, pour autant qu'elles ne ressortent pas du contexte ;\\
				5° S'il y a lieu, les informations relatives aux garanties légales, aux fonctionnalités du contenu numérique et, le cas échéant, à son interopérabilité, à l'existence et aux modalités de mise en œuvre des garanties et aux autres conditions contractuelles ;\\
				6° La possibilité de recourir à un médiateur de la consommation dans les conditions prévues au titre Ier du livre VI.
				La liste et le contenu précis de ces informations sont fixés par décret en Conseil d'Etat.
				Les dispositions du présent article s'appliquent également aux contrats portant sur la fourniture d'eau, de gaz ou d'électricité, lorsqu'ils ne sont pas conditionnés dans un volume délimité ou en quantité déterminée, ainsi que de chauffage urbain et de contenu numérique non fourni sur un support matériel. Ces contrats font également référence à la nécessité d'une consommation sobre et respectueuse de la préservation de l'environnement.\\
				
				\textbf{\color{blue} Article L111-2} \\
				Outre les mentions prévues à l'article {\color{blue}L. 111-1}, tout professionnel, avant la conclusion d'un contrat de fourniture de services et, lorsqu'il n'y a pas de contrat écrit, avant l'exécution de la prestation de services, met à la disposition du consommateur ou lui communique, de manière lisible et compréhensible, les informations complémentaires relatives à ses coordonnées, à son activité de prestation de services et aux autres conditions contractuelles, dont la liste et le contenu sont fixés par décret en Conseil d'Etat.\\
				Les informations complémentaires qui ne sont communiquées qu'à la demande du consommateur sont également précisées par décret en Conseil d'Etat.\\
				 
				 
				\textbf{\color{blue} Article R111-2} \\
				I.-Pour l'application du I de l'article {\color{blue}L. 111-2}, outre les informations prévues à l'article {\color{blue}R. 111-1}, le professionnel communique au consommateur ou met à sa disposition les informations suivantes :\\
				 
				a) Le statut et la forme juridique de l'entreprise ;\\
				b) Les coordonnées permettant d'entrer en contact rapidement et de communiquer directement avec lui ;\\
				c) Le cas échéant, le numéro d'inscription au registre du commerce et des sociétés ou au répertoire des métiers ;\\
				d) Si son activité est soumise à un régime d'autorisation, le nom et l'adresse de l'autorité ayant délivré l'autorisation ;\\
				e) S'il est assujetti à la taxe sur la valeur ajoutée et identifié par un numéro individuel en application de l'article 286 ter du code général des impôts, son numéro individuel d'identification ;\\
				f) S'il est membre d'une profession réglementée, son titre professionnel, l'Etat membre dans lequel il a été octroyé ainsi que, le cas échéant, le nom de l'ordre ou de l'organisme professionnel auprès duquel il est inscrit ;\\
				g) Les conditions générales, s'il en utilise ;\\
				h) Le cas échéant, les clauses contractuelles relatives à la législation applicable et la juridiction compétente ;\\
				i) L'éventuelle garantie financière ou assurance de responsabilité professionnelle souscrite par lui, les coordonnées de l'assureur ou du garant ainsi que la couverture géographique du contrat ou de l'engagement.\\
				 
				II.-En outre, tout professionnel prestataire de services doit également communiquer au consommateur qui en fait la demande les informations complémentaires suivantes :\\
				 
				a) Lorsque le prix n'est pas déterminé au préalable par le prestataire pour un type de service donné, le prix du service ou, lorsqu'un prix exact ne peut pas être indiqué, la méthode de calcul permettant au destinataire de vérifier ce dernier, ou un devis suffisamment détaillé ;\\
				b) En ce qui concerne les professions réglementées, une référence aux règles professionnelles applicables dans l'Etat membre de l'Union européenne sur le territoire duquel ce professionnel est établi et aux moyens d'y avoir accès ;\\
				c) Des informations sur ses activités pluridisciplinaires et ses partenariats qui sont directement liés au service concerné et sur les mesures prises pour éviter les conflits d'intérêts. Ces informations figurent dans tout document d'information dans lequel le prestataire présente de manière détaillée ses services ;\\
				d) Les éventuels codes de conduite auxquels il est soumis, l'adresse électronique à laquelle ces codes peuvent être consultés ainsi que les versions linguistiques disponibles ;\\
				e) Les informations sur les conditions de recours à des moyens extrajudiciaires de règlement des litiges, lorsque ces moyens sont prévus par un code de conduite, un organisme professionnel ou toute autre instance.\\
				
				III.-Au sens du d du I, un régime d'autorisation s'entend de toute procédure qui a pour effet d'obliger un prestataire ou un destinataire à faire une démarche auprès d'une autorité compétente en vue d'obtenir un acte formel ou une décision implicite relative à l'accès à une activité de services ou à son exercice.\\
				
				\section{Commandes}
				
				\subsection{Caractère définitif de la commande}
				Le contrat est conclu à la date de la signature de la commande par le consommateur, sous réserve de l'acceptation de cette commande par le prestataire.
				
				\subsection{Devis}
				Les prestations de services, dont le prix ne peut être calculé à l'avance, peuvent donner lieu à l'établissement d'un devis estimatif préalable.\\
				Le devis est établi pour une durée limitée XX et son acceptation par le consommateur vaut conclusion définitive du contrat.\\
				
				\subsection{Modification de la commande}
				Les commandes étant définitives et irrévocables, toute demande de modification du service commandé par le consommateur doit être soumise à l'acceptation du prestataire.\\
				En cas d'indisponibilité du service commandé, le prestataire propose au consommateur, qui doit donner son accord, la fourniture d'un service équivalent susceptible de remplacer le service commandé.\\
				En cas de désaccord du client, l'indisponibilité du service commandé entraine l'annulation de la commande et le remboursement du consommateur.\\
				Le prestataire se réserve le droit d'apporter au service commandé les évolutions liées à l'évolution technique dans les conditions prévues à l'article R. 212-4, 4 du code de la consommation.\\
				
				\subsection{Prestation de services financée par un crédit à la consommation}
				Le contrat de prestations de services, lorsqu'il est financé par un crédit, sera résolu de plein droit :\\
				- si le prêteur n'a pas informé le prestataire de l'attribution du crédit dans le délai de sept jours à compter de l'acceptation de l'offre de crédit par l'emprunteur ;
				- ou si l'emprunteur a exercé, dans ce même délai, son droit de rétractation.
				
				\subsection{Résiliation ou résolution de la commande}
				La commande peut être résolue par le consommateur par lettre recommandée avec demande d'avis de réception ou par un écrit sur un autre support durable en cas :\\
				- d'exécution d'une prestation de service non conforme aux caractéristiques déclarées du service ;\\
				- d'exécution dépassant la date limite fixée dans le bon de commande ou, à défaut d'une telle date, dans les trente jours suivant la conclusion du contrat, après avoir enjoint auparavant, selon les mêmes modalités et sans résultat, le vendeur d'effectuer la livraison dans un délai supplémentaire raisonnable ;\\
				- de hausse du prix qui n'est pas justifiée par une modification technique du service imposée par les pouvoirs publics.\\
				
				Dans tous ces cas, l'acheteur peut exiger le remboursement de l'acompte versé à la commande majoré des intérêts calculés au taux légal à partir de la date d'encaissement de l'acompte.\\
				
				La commande peut être résolue par le prestataire de services en cas :\\
				- de refus d'exécution de la prestation commandée ;\\
				- de non-paiement du prix (ou du solde du prix) après l'exécution de la prestation.\\
				
				Dans tous ces cas, l'acompte versé à la commande reste acquis prestataire de services à titre d'indemnité.\\
				
				\section{Caractéristiques des services commandés}
				La prestation attendue est détaillée dans une note descriptive ou dans un cahier des charges annexé au présent contrat et en faisant partie intégrante.
				
				\section{Prix}
				
				\subsection{Détermination du prix}
				Les prix des services mentionnés sur le bon de commande sont les prix hors taxe figurant sur le catalogue du prestataire au jour de la commande.\\
				Ces prix sont fermes et définitifs.\\
				Les prix des services sont entendus toutes taxes comprises.\\
				
				\textbf{\color{blue} Article L112-4}\\
				 
				Dans le cas d'un contrat à durée indéterminée ou d'un contrat assorti d'un abonnement, le prix total inclut le total des frais exposés pour chaque période de facturation. Lorsque de tels contrats sont facturés à un tarif fixe, le prix total inclut également le total des coûts mensuels.\\
				Lorsque le coût total ne peut être raisonnablement calculé à l'avance, le mode de calcul du prix est communiqué.\\
				
				\subsection{Modification du prix}
				Le prestataire se réserve le droit de modifier unilatéralement les prix des services à tout moment, notamment en cas d'augmentation des coûts, étant entendu que, en cas d'augmentation des prix postérieure à la commande, seul le prix fixé au jour de cette commande sera applicable au client.
				
				\section{Paiement}
				
				\subsection{Moment du paiement}
				Le prix de la prestation est réglé à chaque début du mois.
				
				\subsection{Mode de paiement}
				Le règlement peut s'effectuer en espèces ou par tout mode de paiement à l'exception des lettres de change et des billets à ordre lorsque la vente est financée par un crédit en vertu de l'article L. 314-21 du code de la consommation.
				
				\subsection{Retard de paiement}
				Toute somme non payée à l'échéance est productive, sans mise en demeure préalable, d'un intérêt à un taux conventionnel
				
				\subsection{Défaut de paiement}
				Le prestataire de services se réserve le droit, lorsque le prix convenu n'est pas payé à l'échéance, soit de demander l'exécution de la prestation, soit de résoudre le contrat par simple lettre recommandée avec demande d'avis de réception et de conserver, à titre d'indemnité, l'acompte versé à la commande.
				
				\section{Durée et reconduction du contrat}
				\textbf{\color{blue} Article L. 215-1 du code de la consommation} – Pour les contrats de prestations de services conclus pour une durée déterminée avec une clause de reconduction tacite, le professionnel prestataire de services informe le consommateur par écrit, par lettre nominative ou courrier électronique dédiés, au plus tôt trois mois et au plus tard un mois avant le terme de la période autorisant le rejet de la reconduction, de la possibilité de ne pas reconduire le contrat qu'il a conclu avec une clause de reconduction tacite. Cette information, délivrée dans des termes clairs et compréhensibles, mentionne, dans un encadré apparent, la date limite de non-reconduction.
				Lorsque cette information ne lui a pas été adressée conformément aux dispositions du premier alinéa, le consommateur peut mettre gratuitement un terme au contrat, à tout moment à compter de la date de reconduction.
				Les avances effectuées après la dernière date de reconduction ou, s'agissant des contrats à durée indéterminée, après la date de transformation du contrat initial à durée déterminée, sont dans ce cas remboursées dans un délai de trente jours à compter de la date de résiliation, déduction faite des sommes correspondant, jusqu'à celle-ci, à l'exécution du contrat. Les dispositions du présent article s'appliquent sans préjudice de celles qui soumettent légalement certains contrats à des règles particulières en ce qui concerne l'information du consommateur.
				
				\section{Exécution du contrat}
				Le prestataire s'engage à exécuter le service au moment de la mise en circulation du véhicule.\\
				 
				\textbf{\color{blue} Article L. 216-2 du code de la consommation} –En cas de manquement du professionnel à son obligation de livraison du bien ou de fourniture du service à la date ou à l'expiration du délai prévus au premier alinéa de l'article L. 216-1 ou, à défaut, au plus tard trente jours après la conclusion du contrat, le consommateur peut résoudre le contrat, par lettre recommandée avec demande d'avis de réception ou par un écrit sur un autre support durable, si, après avoir enjoint, selon les mêmes modalités, le professionnel d'effectuer la livraison ou de fournir le service dans un délai supplémentaire raisonnable, ce dernier ne s'est pas exécuté dans ce délai.\\
				Le contrat est considéré comme résolu à la réception par le professionnel de la lettre ou de l'écrit l'informant de cette résolution, à moins que le professionnel ne se soit exécuté entre-temps.\\
				Le consommateur peut immédiatement résoudre le contrat lorsque le professionnel refuse de livrer le bien ou de fournir le service ou lorsqu'il n'exécute pas son obligation de livraison du bien ou de fourniture du service à la date ou à l'expiration du délai prévu au premier alinéa de l'article L. 216-1 et que cette date ou ce délai constitue pour le consommateur une condition essentielle du contrat. Cette condition essentielle résulte des circonstances qui entourent la conclusion du contrat ou d'une demande expresse du consommateur avant la conclusion du contrat.\\
				
				\textbf{\color{blue} Article L. 216-3 du code de la consommation} – Lorsque le contrat est résolu dans les conditions prévues à l'article L. 216-2, le professionnel rembourse le consommateur de la totalité des sommes versées, au plus tard dans les quatorze jours suivant la date à laquelle le contrat a été dénoncé.\\
				
				\subsection{Conformité}
				Le prestataire s'engage à fournir un service conforme aux prescriptions légales en vigueur et aux prescriptions contractuelles.\\
				Le prestataire est responsable de la non-conformité du service dans les conditions de droit commun.\\
				
				Lorsqu'il agit en garantie légale de conformité, le consommateur :\\
				- bénéficie d'un délai de deux ans à compter de la délivrance du bien pour agir ;\\
				- peut choisir entre la réparation ou le remplacement du bien, sous réserve des conditions de coût prévues par l'article L. 217-9 du code de la consommation ;\\
				- est dispensé de rapporter la preuve de l'existence du défaut de conformité du bien durant les vingt-quatre mois à compter de la délivrance du bien du 18 mars 2016, sauf pour les biens d'occasion\\
				 
				Le consommateur peut décider de mettre en œuvre la garantie contre les défauts cachés de bien livré au sens de l'article 1641 du code civil. Dans cette hypothèse, il peut choisir entre la résolution de la vente ou une réduction du prix de vente conformément à l'article 1644 du code civil.\\
				
				\subsection{Obligation de conseil}
				Le prestataire est tenu d'une obligation de conseil envers son client sur l'utilité et les conditions d'exécution des travaux, sur les conditions d'entretien, d'installation et d'emploi des appareils.\\
				Le prestataire est tenu d'une obligation de renseignement et de conseil envers son client sur toute prestation concernant sa personne ou ses biens.
				
				\section{Inexécution du contrat}
				
				\subsection{Exonération de responsabilité et force majeure}
				La responsabilité du prestataire ne peut pas être engagée en cas d'inexécution ou de mauvaise exécution de ses obligations qui est due, soit au fait du client, soit au fait insurmontable et imprévisible d'un tiers au contrat, soit à un cas de force majeure.\\
				En dehors de ces causes d'exonération, la responsabilité de droit commun encourue dépend de la qualification des obligations du prestataire en obligation de résultat ou en obligation de moyens.\\
				
				\subsection{Responsabilité du prestataire}
				En aucun cas, le prestataire ne peut voir sa responsabilité engagée pour des dommages causés au bénéficiaire du service à la suite d'une utilisation du service ou du bien objet du service qui s‘est avérée non conforme aux prescriptions du prestataire et aux règles de l'art.
				
				\subsection{Responsabilité du bénéficiaire du service – Annulation de commande}
				En cas d'annulation de commande par le bénéficiaire du service en dehors d'un cas de force majeure, le prestataire de services se réserve la faculté de conserver ou de réclamer une somme d'un montant égal au préjudice subi par l'annulation du contrat.\\
				À défaut de prise de livraison par le bénéficiaire du service dans le délai fixé, le prestataire peut demander en justice au choix, l'exécution forcée ou des frais de dépôt ou des dommages et intérêts pour le préjudice subi.\\
				À défaut de paiement à l'échéance, le bénéficiaire du service est mis en demeure par lettre recommandée avec demande d'avis de réception d'exécuter le paiement dans un délai de quinze jours à compter de la date de réception de la lettre de mise en demeure.\\
				À défaut de paiement quinze jours après la mise en demeure d'exécuter, le prestataire se réserve le droit de suspendre l'exécution des prestations en cours ou de prononcer la résolution de plein droit du contrat et de conserver, à titre d'indemnité, l'acompte versé à la commande.\\
				En cas de retard de paiement et après mise en demeure, toute somme non versée à la date d'échéance est, à partir de cette date, productive d'intérêt au taux légal.\\
				
				\section{Résolution du contrat et clause résolutoire}
				En cas de manquement par le bénéficiaire du service à l'une quelconque de ses obligations et quinze jours après mise en demeure d'avoir à exécuter cette obligation dans un délai raisonnable, le prestataire peut demander la résolution du contrat sans préjudice de dommages et intérêts.\\
				La résolution du contrat sera prononcée par lettre recommandée avec demande d'avis de réception et sera acquise de plein droit sans formalité judiciaire.\\
				
				\section{Traitement des données personnelles (no de déclaration CNIL)}
				Le traitement informatisé des données personnelles recueillies a pour finalité la communication aux partenaires commerciaux afin d’optimiser le service\\
				Conformément à la loi Informatique et Libertés, vous disposez d'un droit d'accès, de rectification et, sous réserves des dispositions légales applicables à la matière, de suppression des données vous concernant, le responsable du traitement étant MONSIEUR/MADAME XXX.
				Si vous l'avez préalablement accepté, vous pourrez recevoir des emails ou des SMS marketing dont vous pouvez vous désinscrire, pour les emails, en cliquant sur le lien de désinscription figurant au bas de chaque e-mail reçu et pour les SMS en cliquant sur STOP dans chaque SMS reçu.\\
				La collecte des données nominatives, leur utilisation au titre du traitement des commandes et de la constitution de fichiers clientèle et leur diffusion à des tiers chargés de l'exécution et du paiement des commandes, est subordonnée au consentement de la personne concernée.\\
				Le traitement des données nominatives, qui sont conservées par l'éditeur aux seules fins d'une bonne administration des commandes et des relations commerciales, fait l'objet d'une déclaration auprès de la Commission nationale Informatique et Libertés.\\
				Le bénéficiaire du service dispose à tout moment d'un droit d'accès, de modification, de rectification et de suppression des données personnelles le concernant.\\
				
				\section{Règlement des litiges}
				
				\subsection{Réclamation}
				Toute réclamation doit être adressée au service clientèle de l'entreprise dont l'adresse suit.
				
				\subsection{Médiation}
				En cas d'échec de la demande de réclamation faite après du service clientèle ou en cas d'une absence de réponse dans ce service dans le délai de quinze jours, le consommateur, bénéficiaire du service, peut soumettre le différend qui l'oppose à son contractant au médiateur (<NOM MEDIATEUR> <CONTACT MEDIATEUR>) qui tentera, en toute indépendance et impartialité, de rapprocher les parties en vue d'aboutir à une solution amiable.
				
				\subsection{Clause attributive de compétence}
				Le tribunal compétent territorialement est le tribunal du lieu ou du siège social du défendeur ou sur celui du lieu d'exécution de la prestation de services.\\
				\\
				
				Fait le <DATE> en deux exemplaires à <VILLE>.\\
				
				\begin{table}[h]
				    \begin{tabular}{p{8cm} p{8cm}}
				        Le Prestataire & Le Client \\
				        <NOM REPRESENTANT & <NOM CLIENT> \\      
				        signature & signature
				    \end{tabular}
				\end{table}
				
				\end{document}
	'''
	
	def static compile(Entete e) '''
		
		«FOR p : e.partie»
			«IF p.role === "Prestataire"»
				La société <NOM SOCIETE>, au capital de <INT> euros, ayant son siège social au <ADRESSE> inscrite au Registre du commerce et des sociétés de <VILLE DE REGISTRE> sous le numéro <NUMERO SIRET>, pris en la personne de son représentant légal, MONSIEUR <NOM REPRESENTANT>. \\
						
				Ci-après désigné "le Prestataire" \\ 
						
				D’une part,\\
			«ENDIF»
		«ENDFOR»
		Et :\\
		«FOR p : e.partie»
			«IF p.role === "Client"»
				<PRENOM CLIENT>, <NOM CLIENT>, <ADRESSE CLIENT>\\
				
				Ci-après désigné "le Client"\\
				
				D’autre part,\\
			«ENDIF»
		«ENDFOR»
	'''
	
}