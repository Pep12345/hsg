#### QUERY ####
query_person = '''SELECT r.id, r.title
                    FROM resource as r JOIN resource_class as rc on r.resource_class_id = rc.id
                    WHERE rc.local_name='Painter' OR
                            rc.local_name='Artist' OR
                            rc.local_name='Breeder' OR
                            rc.local_name='Town_priest'OR
                            rc.local_name='Single_agent';'''

query_org = '''SELECT r.id, r.title
                    FROM resource as r JOIN resource_class as rc on r.resource_class_id = rc.id
                    WHERE rc.local_name='Collective_agent' OR
                            rc.local_name='Administrative_entity' OR
                            rc.local_name='Association' OR
                            rc.local_name='Lordship' OR
                            rc.local_name='Ruler' OR
                            rc.local_name='Brotherhood' OR
                            rc.local_name='Breeder_brotherhood' OR
                            rc.local_name='Mutual_aid_society' OR
                            rc.local_name='Family' OR
                            rc.local_name='Royal_family' OR
                            rc.local_name='Single_agent';'''

query_fact = '''SELECT r.id, r.title
                    FROM resource as r JOIN resource_class as rc on r.resource_class_id = rc.id
                    WHERE rc.local_name='Fact' OR
                            rc.local_name='Action' OR
                            rc.local_name='Acquisition' OR
                            rc.local_name='Commissioning' OR
                            rc.local_name='Economic_development' OR
                            rc.local_name='Erection_of_church' OR
                            rc.local_name='Search' OR
                            rc.local_name='Transhumance' OR
                            rc.local_name='Situation' OR
                            rc.local_name='Administrative_affiliation' OR
                            rc.local_name='Artistic-geographic_affiliation' OR
                            rc.local_name='Business_partnership' OR
                            rc.local_name='Goal';'''

query_geo_region = '''SELECT r.id, r.title
                    FROM resource as r JOIN resource_class as rc on r.resource_class_id = rc.id
                    WHERE rc.local_name='Geographic_region' OR
                            rc.local_name='Culturally-defined_region' OR
                            rc.local_name='Place_region' OR
                            rc.local_name='Human_settlement' OR
                            rc.local_name='Meadow_for_breeding_livestock' OR
                            rc.local_name='Transit_region' OR
                            rc.local_name='Itinerary' OR
                            rc.local_name='Itinerary_CisalpineLands-France' OR
                            rc.local_name='Religious_procession_route' OR
                            rc.local_name='Itinerary_step' OR
                            rc.local_name='Pass' OR
                            rc.local_name='Valley' OR
                            rc.local_name='Political-administrative_region' OR
                            rc.local_name='County' OR
                            rc.local_name='Diocese' OR
                            rc.local_name='Municipality' OR
                            rc.local_name='Roman_century';'''

query_obj = '''SELECT r.id, r.title
                    FROM resource as r JOIN resource_class as rc on r.resource_class_id = rc.id
                    WHERE rc.local_name='Geographic_region' OR
                            rc.local_name='Object' OR
                            rc.local_name='Artwork' OR
                            rc.local_name='Painting' OR
                            rc.local_name='Fresco' OR
                            rc.local_name='Miniature' OR
                            rc.local_name='Series_of_painting';'''

query_place = '''SELECT r.id, r.title
                    FROM resource as r JOIN resource_class as rc on r.resource_class_id = rc.id
                    WHERE rc.local_name='Place' OR
                            rc.local_name='Place_of_production' OR
                            rc.local_name='Place_of_sacred_things' OR
                            rc.local_name='Place_of_sociality' OR
                            rc.local_name='Hospice' OR
                            rc.local_name='Hospital';'''

query_ref_model = '''SELECT r.id, r.title
                    FROM resource as r JOIN resource_class as rc on r.resource_class_id = rc.id
                    WHERE rc.local_name='Reference_model' OR
                            rc.local_name='Decorative_style' OR
                            rc.local_name='Reference_sample' OR
                            rc.local_name='Reference_style';'''

query_theme = '''SELECT r.id, r.title
                    FROM resource as r JOIN resource_class as rc on r.resource_class_id = rc.id
                    WHERE rc.local_name='Theme' OR
                            rc.local_name='Iconographic_theme';'''

query_time = '''SELECT r.id, r.title
                    FROM resource as r JOIN resource_class as rc on r.resource_class_id = rc.id
                    WHERE rc.local_name='Time_interval';'''
