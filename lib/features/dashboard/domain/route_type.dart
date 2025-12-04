enum RouteType {
  spokeToPCRLabGeneXpert(
    "Spoke -> PCR Lab/GeneXpert",
    RouteTypeCategory.specimen,
  ),
  spokeToHubGeneXpert("Spoke -> Hub/GeneXpert", RouteTypeCategory.specimen),
  hubToPCRLab("Hub -> PCR Lab", RouteTypeCategory.specimen),
  geneXpertToSpoke("GeneXxpert -> Spoke", RouteTypeCategory.result);

  final String label;
  final RouteTypeCategory category;

  const RouteType(this.label, this.category);
}

enum RouteTypeCategory { specimen, result }
