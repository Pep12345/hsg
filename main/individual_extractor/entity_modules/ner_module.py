# Named entity recognition module
# This module combine the result by SpaCy NER and Stanza NER
# in case of intersection:
# if the text is different we will take the longer mention extracted
# if the text is the same for both, the Stanza output will be considered as more relevant

# author: Giuseppe Biondi


import stanza
import spacy
from itertools import combinations
from main.utils.module import EntityModule
from main.utils.entity import Entity


#### MAIN CLASS ####
class NerModules:
    def __init__(self):
        # add here new modules
        spacy_module = SpaCyModule()
        stanza_module = StanzaModule()
        # add modules to list
        self._list_module = [spacy_module, stanza_module]

    def get_ner_modules(self):
        return self._list_module


###### NER MODULES ######
# Each module contain a method "extract" that take in input a text and return a list of object Entity


class SpaCyModule(EntityModule):
    def __init__(self):
        super().__init__("spacy_module")
        self._spacy_nlp = spacy.load("it_core_news_lg")

    def extract(self, text: str):
        list_ne = []
        doc = self._spacy_nlp(text)
        return [Entity(str_text=ent.text, ner_type=ent.label_,
                       start_char=ent.start_char, end_char=ent.end_char) for ent in doc.ents]


class StanzaModule(EntityModule):
    def __init__(self):
        super().__init__("stanza_module")
        self._stanza_nlp = stanza.Pipeline('it')

    def extract(self, text: str):
        doc = self._stanza_nlp(text)
        return [Entity(str_text=ent.text, ner_type=ent.type,
                       start_char=ent.start_char, end_char=ent.end_char) for ent in doc.ents]





#### TODO:DA CANCELLARE ####
    # Return None if there isn't intersection else
    # Return 0 if tuple1 is longer than tuple2 else 1
    def _check_intersect_and_return_longer_tuple(self, tuple1, tuple2):
        index1 = range(tuple1[0], tuple1[1])
        index2 = range(tuple2[0], tuple2[1])
        if set(index1).intersection(set(index2)):
            return 0 if len(index1) >= len(index2) else 1
        else:
            return None

    def main(self, text: str):
        result_dict = {}
        # Add all in a dict
        for stanza_entity in self.stanza_extract_ner(text):
            result_dict[stanza_entity.interval] = stanza_entity
        for spacy_entity in self.spacy_extract_ner(text):
            if spacy_entity.interval not in result_dict:
                result_dict[spacy_entity.interval] = spacy_entity
        # Check intersection between entity
        list_intervals = list(result_dict.keys())
        for t1, t2 in combinations(list_intervals, 2):
            if not t1.intersect(t2).is_empty:
                result_dict.pop(t1 if t1.measure < t2.measure else t2)
        return result_dict.values()

if __name__ == "__main__":
    s =   "I rapporti di Entracque con la valle della Vesubie, attraverso il colle delle Finestre, sulla strada di Nizza, determinarono almeno un altro episodio di committenza: il “mastro da bosco” (falegname) Giacomo Rosso di Lantosca realizza nel 1684 un armadio per la parrocchiale di Sant’Antonino."

    ner = NerModules()
    from pprint import pprint
    pprint([ent.text for ent in ner.spacy_extract_ner(s)])
    pprint("###############")
    pprint([ent.text for ent in ner.stanza_extract_ner(s)])
