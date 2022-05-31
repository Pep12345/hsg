from application_test_control.code import database_connection
import main.utils.utils as utils
from main.utils.module import EntityModule
from main.utils.heuristic import Heuristic
from main.individual_extractor.individual_extractor import IndividualExtractor
from main.wrapper import fragment_extractor
from itertools import compress
import json


class Tester:
    def __init__(self):
        self._ent_extractor = IndividualExtractor()
        self._list_extractor = self._ent_extractor.get_list_modules()
        # using an array of True/False to decide if a module is on or off
        self._active_modules = [True]*len(self._list_extractor)
        # euristic for overlap
        self._list_heuristics = self._ent_extractor.get_list_heuristic()
        # using a variable of True/False to decide witch heuristic is selected
        self._active_heuristic = None

    def get_list_modules(self):
        return self._list_extractor

    def get_list_heuristic(self):
        return self._list_heuristics

    def turn_off_module(self, module: EntityModule = None, module_name: str = None):
        self._turn_on_off_module(state=False, module=module, module_name=module_name)

    def turn_on_module(self, module: EntityModule = None, module_name: str = None):
        self._turn_on_off_module(state=True, module=module, module_name=module_name)

    def select_heuristic(self, heuristic: Heuristic = None, heuristic_name: str = None):
        if heuristic:
            self._active_heuristic = heuristic
        elif heuristic_name:
            self._active_heuristic = next((item for item in self._list_heuristics if item.get_name() == heuristic_name),None)
        else:
            raise ValueError("Insert one between heuristic or heuristic name")
        print(f"starting heuristic {self._active_heuristic} for overlapping entity")

    def _turn_on_off_module(self, state: bool, module: EntityModule = None, module_name: str = None):
        if module:
            index = self._list_extractor.index(module)
        elif module_name:
            index = next((i for i, item in enumerate(self._list_extractor) if item.get_name() == module_name), -1)
        else:
            raise ValueError("Insert one between module or module name")
        self._active_modules[index] = state

    def start_analysis(self, text):
        list_active_modules = list(compress(self._list_extractor, self._active_modules))
        list_entities = self._ent_extractor.start_analysis(text, list_active_modules, self._active_heuristic)
        return list_entities

    def _analyze_document_file_using_wrapper_and_entity_extractor(self, file_path):
        # Using wrapper for extract fragments
        fragments_list = json.loads(fragment_extractor.extract_fragments(file_path=file_path))
        ent_list = []
        # for each fragment, start analysis of his text
        for frag in fragments_list:
            ent_list += self.start_analysis(frag['text'])
        return ent_list

    def start_test(self):
        print('start test')
        # extract predicted entities
        all_entities_predicted = []
        list_document_path_for_test = ['../../test_example/castelletto_da_stura.txt',
                                       '../../test_example/valle_gesso.TXT',
                                       '../../test_example/entracque.txt']
        for doc in list_document_path_for_test:
            all_entities_predicted += self._analyze_document_file_using_wrapper_and_entity_extractor(doc)

        result_list = []
        # get precision and recall

        # PER
        set_person_predicted = set([ent.text for ent in all_entities_predicted if ent.ner_type == 'PER'])
        set_person_gold = database_connection.extract_person()
        p, r, s, l = utils.precion_and_recall_between_two_sets_exact_match(set_person_predicted, set_person_gold)
        f1 = 2 * (p * r) / (p + r) if p != 0 and r != 0 else 0
        result_list.append(['PER', p, r, f1, 'exact match', s, l])
        p, r, s, l= utils.precision_and_recall_between_two_sets_partial_match_using_in(set_person_predicted, set_person_gold)
        f1 = 2 * (p * r) / (p + r) if p != 0 and r != 0 else 0
        result_list.append(['PER', p, r, f1, 'partial match', s, l])


        # LOC
        set_location_predicted = set([ent.text for ent in all_entities_predicted if ent.ner_type == 'LOC'])
        set_location_gold = database_connection.extract_location()
        p, r, s, l = utils.precion_and_recall_between_two_sets_exact_match(set_location_predicted, set_location_gold)
        f1 = 2 * (p * r) / (p + r) if p != 0 and r != 0 else 0
        result_list.append(['LOC', p, r, f1, 'exact match', s, l])
        p, r, s, l = utils.precision_and_recall_between_two_sets_partial_match_using_in(set_location_predicted, set_location_gold)
        f1 = 2 * (p * r) / (p + r) if p != 0 and r != 0 else 0
        result_list.append(['LOC', p, r, f1, 'partial match', s, l])

        # ORG
        set_organization_predicted = set([ent.text for ent in all_entities_predicted if ent.ner_type == 'ORG'])
        set_organization_gold = database_connection.extract_org()
        p, r, s, l  = utils.precion_and_recall_between_two_sets_exact_match(set_organization_predicted, set_organization_gold)
        f1 = 2 * (p * r) / (p + r) if p != 0 and r != 0 else 0
        result_list.append(['ORG', p, r, f1, 'exact match', s, l])
        p, r, s, l  = utils.precision_and_recall_between_two_sets_partial_match_using_in(set_organization_predicted, set_organization_gold)
        f1 = 2 * (p * r) / (p + r) if p != 0 and r != 0 else 0
        result_list.append(['ORG', p, r, f1, 'partial match', s, l])

        # MISC
        set_misc_predicted = set([ent.text for ent in all_entities_predicted if ent.ner_type == 'MISC'])
        set_misc_gold = database_connection.extract_other().union(database_connection.extract_time())
        p, r, s, l  = utils.precion_and_recall_between_two_sets_exact_match(set_misc_predicted, set_misc_gold)
        f1 = 2 * (p * r) / (p + r) if p != 0 and r != 0 else 0
        result_list.append(['MISC', p, r, f1, 'exact match', s, l])
        p, r, s, l  = utils.precision_and_recall_between_two_sets_partial_match_using_in(set_misc_predicted, set_misc_gold)
        f1 = 2 * (p * r) / (p + r) if p != 0 and r != 0 else 0
        result_list.append(['MISC', p, r, f1, 'partial match', s, l])

        # Without Type check
        set_predicted = set([ent.text for ent in all_entities_predicted])
        set_gold = database_connection.extract_other().union(database_connection.extract_time())\
            .union(database_connection.extract_location()).union(database_connection.extract_person())\
            .union(database_connection.extract_org())
        p, r, s, l  = utils.precion_and_recall_between_two_sets_exact_match(set_predicted, set_gold)
        f1 = 2 * (p * r) / (p + r) if p != 0 and r != 0 else 0
        result_list.append(['/', p, r, f1, 'exact match', s, l])
        p, r, s, l  = utils.precision_and_recall_between_two_sets_partial_match_using_in(set_predicted, set_gold)
        f1 = 2 * (p * r) / (p + r) if p != 0 and r != 0 else 0
        result_list.append(['/', p, r, f1, 'partial match', s, l])

        return result_list