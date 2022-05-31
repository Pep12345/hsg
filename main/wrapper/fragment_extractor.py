# library for extract fragment given a text file using hsg ontology info
# input un file.txt dove i frammenti son delimitati da una sezione, i.e. [localizzazione]
# e le fonti son rappresentate tra parentesi quadre, i.e [fonte: http....]

# output un file json nel seguente formato
# {fragment_list:[
#               {type:....,
#               text:....,
#               source:[...]}]
import json
import os
import re
from pprint import pprint

fragment_list = []


## TODO >> implementare una richiesta diretta all'ontologia
def load_fragment_types():
    global wrapper_list
    dir = os.path.dirname(os.path.abspath(__file__))
    with open(dir + '/' + 'wrapper_list.txt', "r", encoding='utf-8') as w:
        fragment_list = [line.rstrip().lower() for line in w]


def clean_text(text):
    return re.sub(r'\s+', ' ', re.sub(r'^\W+', '', text))


# input: il testo di un fragmento
# output: le sotto-sezioni riferite a diverse fonti
def extract_sub_parts(full_text, fragment_list, fragment_type):
    source_list = re.findall(r'[[].*[]]', full_text)

    for sub_section in source_list:
        # estraggo le parti
        text_fragment = re.search(rf'\s*(.*)\s*{re.escape(sub_section)}', full_text, re.DOTALL).group(1) #estraggo testo completo
        text_fragment = clean_text(text_fragment)
        source_fragment = re.sub(r'\[|\b(fonte|Fonte)(:)+( )+|(\])', '', sub_section)
        source_fragment = clean_text(source_fragment)
        
        # rimuovo il testo già estratto
        full_text = full_text.split(sub_section, 1)[1]
        if not text_fragment:
            fragment_list[-1]['source'].append(source_fragment)
        else:
            fragment_list.append({'type': fragment_type,
                                  'text': text_fragment,
                                  'source': [source_fragment]})
        
    # check se rimangono parti senza fonte
    if not full_text.isspace():
        print(fragment_type)
        text_fragment = clean_text(full_text)
        if text_fragment:
            fragment_list.append({'type': fragment_type,
                                  'text': text_fragment})


# input: testo, frammento1, frammento2
def extract_fragment_parts(text_document, fragment_list, f1, f2=None):
    if f2 is not None:
        type = f1.replace('[', '').replace(']','')  # estraggo il tipo
        full_text = re.search(rf'{re.escape(f1)}\s*(.*)\s*{re.escape(f2)}', text_document, re.DOTALL).group(1) #estraggo testo completo
    else:
        type = f1.replace('[', '').replace(']','')
        full_text = re.search(rf'{re.escape(f1)}\s*(.*)\s*', text_document, re.DOTALL).group(1) #estraggo testo completo

    print('start analyzing fragment:',type)
    extract_sub_parts(full_text, fragment_list, type)


# input una stringa di testo
# output un file json contenente la dictionary descritta ad inizio file
def extract_fragments(text=None, file_path=None):
    if text is None:
        if file_path is None:
            raise ValueError("Insert text or file_path argument")
        text = open(file_path, "r", encoding='utf-8').read()
    fragment_list = []
    
    # Riconosco i frammenti come tutte le parti che han meno di 50 caratteri tra parentesi quadre
    # Questa chiamata verrà sostituita nel momento che avremo una lista di tipi di frammento definitiva
    fragments = re.findall(r'[[].{,50}[]]', text)

    # creo coppia frammento1 frammento2 per estrarre il testo contenuto in mezzo
    fragment_pairs = list(zip(fragments, fragments[1:]))
    for f1, f2 in fragment_pairs:
        extract_fragment_parts(text, fragment_list, f1, f2)
    
    # ripeto per l'ultimo frammento rimasto
    extract_fragment_parts(text, fragment_list, f2)

    pprint(fragment_list)

    return json.dumps(fragment_list, indent=4, ensure_ascii=False)


if __name__ == "__main__":
    f = open("../../test_example/castelletto_da_stura.txt", "r", encoding='utf-8')
    json_res = extract_fragments(f.read())
    f.close()
    f = open("../../wrapper_bozza/result_example1.txt", "w+", encoding='utf-8')
    f.write(json_res)
    f.close()
    f = open("../../wrapper_bozza/result_example1.txt", "r", encoding='utf-8')
    json_test = f.read()
    print("#####################")
    print(json.loads(json_test)[2]['source'][0])
    print(json.loads(json_test)[2]['source'][1])

