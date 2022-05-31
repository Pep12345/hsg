import mysql.connector
from application_test_control.code.queries import *

server = 'localhost'
database = 'hsg'
username = 'hsg1'
password = 'hsg1'

# queries: single_agent, collective_agent, fact, geographic_region, object, place, reference_model, theme, time

def extract_person():
    return run_query(query_person)

def extract_org():
    return run_query(query_org)

def extract_time():
    return run_query(query_time)

# fact, ref model, obejct, theme
def extract_other():
    return run_query(query_fact).union(run_query(query_ref_model))\
            .union(run_query(query_obj)).union(run_query(query_theme))

def extract_location():
    return run_query(query_geo_region).union(run_query(query_place))


def run_query(query):
    db = mysql.connector.connect(host=server, user=username, passwd=password, db=database)
    cursor = db.cursor()

    cursor.execute(query)
    result_tuple = cursor.fetchall()

    return set([row[1] for row in result_tuple])
