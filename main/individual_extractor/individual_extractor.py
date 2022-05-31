from main.individual_extractor.entity_modules.ner_module import NerModules
from main.individual_extractor.entity_modules.gatenlp_gaz import GazetteerModules
from main.individual_extractor.entity_modules.ned_module import NedModules
from main.utils.entity_group import union
from main.individual_extractor.heuristic.Heuristics import HeuristicsModule


class IndividualExtractor:

    def __init__(self):
        # extractor modules
        self._gaz = GazetteerModules()
        self._list_extractor = self._gaz.get_gazetteer_modules()
        self._ner = NerModules()
        self._list_extractor += self._ner.get_ner_modules()
        self._ned = NedModules()
        self._list_extractor += self._ned.get_ned_modules()
        # heuristic
        self._heuristics = HeuristicsModule()
        self._list_heuristics = self._heuristics.get_heuristics_list()


    def get_list_modules(self):
        return self._list_extractor

    def get_list_heuristic(self):
        return self._list_heuristics

    def start_analysis(self, text, list_active_modules=None, active_heuristic=None):
        if text is None or text == "":
            return []
        # set default module list
        if list_active_modules == None: list_active_modules = self._list_extractor
        list_entities = []
        for module in list_active_modules:
            list_entities += module.extract(text)
        if active_heuristic is not None:
            return union(list_entities, active_heuristic)
        return list_entities

if __name__ == "__main__":
    ent_extractor = IndividualExtractor()
    listaa = ent_extractor.get_list_modules()
    active_modules = [True]*len(listaa)
    active_modules[1] = False
    from itertools import compress
    list_active_modules = list(compress(listaa, active_modules))
    heu = ent_extractor.get_list_heuristic()[0]
    from text_examples import articolo2_parte_1 as text
    list_entities = ent_extractor.start_analysis(text, list_active_modules, heu)
    print(list_entities)