# Add new extractor

In entity_modules there are 3 file:
- ner modules
- ned or el modules
- gazetter

This is for don't mix extractor but it's not necessary to add in the correct task, it will work anyway 

####Create new extractor
 Create a new class that extends main.utils.module.EntityModule
 
 implements the extract method (it need to return a list of main.utils.entity.Entity)
 
 add the class to one of the entity_modules
 
example: add a ned extractor
 
In the ned_modules class:

    class NedModules:
        def __init__(self):
        ... some extrators..
        
        # create class extactor
        my_new_ned_extractor = MyExtractor()

        # add extractor to list modules
        self._list_module = [..some extractors..,
                                my_new_ned_extractor]

Your new extractor will be like:

    class MyExtractor(EntityModule):
    def __init__(self, api_key):
        /// do something.. //

    def extract(self, text):
        /// do something.. //
        return list of Entity


####Create new heuristic

 In the Heuristics file, define a new class MyHeuristic that extends the abstract class "main.utils.heuristic.Heuristic" and then implements his method "get_best_entity"
 
add the new class to HeuristicsModule

example:
 
create new heuristic:

    class LongerEntityHeuristic(Heuristic):
        def __init__(self):
            /// do something.. //

    def get_best_entity(self, entity1: Entity, entity2: Entity):
        /// do something.. //
        return entity1 or entity2

add heuristic to HeuristicsModule

    class HeuristicsModule:
        def __init__(self):
            ... some heuristics..

            # add here new modules
            my_heuristic = MyHeuristic()

            # add modules to list
            self._list_module = [... some heuristics..,
                                my_heuristic]

### Gazetteer

for add a new gazetteer, follow the instruction of "create new extractor"

for add data in the gatenlp gazetter:

Uncomment line 13 and 16 in gatenlp_gaz and comment line 16

add Data in gazetter between line 13 and 15 using the following method:

- add terms for extract a class (ner)
    
    
    gate_gazetteer.add_list_of_word_for_identify_class([term1, term2, term3], 'YourClassName')

- add terms for extract url (ned/el)

    
        # create the list of tuple (term - url)   
        gaz1 = [
            ("term1", "https://wikidata/term1"),
            ("term2", "https://wikidata/term2"),
        ]
        
        # add the list to the gazetter
        gate_gazetter.add_list_tuple_word_class(gaz1)

note: it's possible to link a class to the list of tuple

        gate_gazetter.add_list_tuple_word_class(gaz1, YourClassName)