enum RouteType {
  spokeToPCRLabGeneXpert("Spoke -> PCR Lab/GeneXpert"),
  spokeToHubGeneXpert("Spoke -> Hub/GeneXpert"),
  hubToPCRLab("Hub -> PCR Lab"),
  geneXpertToSpoke("Gene Expert -> Spoke");

  final String label;

  const RouteType(this.label);
}
