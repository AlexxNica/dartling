
ProjectEntries fromJsonToProjectEntries(Domain domain, String modelCode) {
  /**
   *  || Project
   *  id name
   *  at description
   */
  var json = '''
      {"width":990,"height":580,
       "lines":[],
       "boxes":[
        {"entry":true,"name":"Project",
         "x":179,"y":226,"width":120,"height":120,
         "items":[
          {"sequence":10,"category":"identifier","name":"name",
           "type":"String","init":""
          },
          {"sequence":20,"category":"attribute","name":"description",
           "type":"String","init":""
          }]
        }]
      }
  ''';
  return new ProjectEntries(fromMagicBoxes(json, domain, modelCode));
}

class ProjectEntries extends ModelEntries {

  ProjectEntries(Model model) : super(model);

  Map<String, Entities> newEntries() {
    var entries = new Map<String, Entities>();
    var concept = model.concepts.findByCode('Project');
    entries[concept.code] = new Projects(concept);
    return entries;
  }

  Projects get projects() => getEntry('Project');

  Concept get projectConcept() => projects.concept;

}