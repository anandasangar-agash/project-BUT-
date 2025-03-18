# Make your tests here
from community_detection import *

def test_list_of_friends():
    assert list_of_friends('files/Communaute0.csv') == ['Alice', 'Bob', 'Bob', 'Charlie', 'Alice', 'Dominique', 'Bob', 'Dominique']
    print('Test ok')
    
amis = list_of_friends('files/Communaute0.csv')
amis1 = list_of_friends('files/Communaute1.csv')   

def test_create_network():
    assert create_network(amis) == {'Alice': ['Bob', 'Dominique'],
                                    'Bob': ['Alice', 'Charlie', 'Dominique'],
                                    'Charlie': ['Bob'],
                                    'Dominique': ['Alice', 'Bob']}
    assert create_network(amis1) == {'Giedrius': ['Mady', 'Illtyd', 'Rufino', 'Glenys', 'Illtyd', 'Björn', 'Louis', 'Vittorio'],
     'Mady': ['Giedrius', 'Rufino', 'Idelle', 'Vittore', 'Placide', 'Cloe', 'Vittorio', 'Björn', 'Vittorio', 'Placide', 'Barbra',
             'Barbra', 'Vittorio', 'Teodor', 'Jakob','Björn'],
     'Kirsa': ['Vittore', 'Vittorio', 'Barbra', 'Jakob', 'Vittore', 'Jakob'],
     'Vittore': ['Kirsa', 'Vittorio', 'Barbra', 'Cloe', 'Mady', 'Kirsa', 'Cloe', 'Björn', 'Barbra', 'Louis', 'Barbra', 'Louis'],
     'Barbra': ['Faizel', 'Vittorio', 'Vittore', 'Kirsa', 'Vittorio', 'Olavi', 'Faizel', 'Marwa', 'Olavi', 'Mady', 'Rufino',                       'Cloe', 'Mady', 'Rufino', 'Louis', 'Vittore', 'Vittore', 'Vittorio'],
     'Faizel': ['Barbra', 'Placide', 'Rufino', 'Barbra', 'Björn', 'Olavi'],
     'Vittorio': ['Vittore', 'Barbra', 'Cloe', 'Placide', 'Louis', 'Kirsa', 'Placide', 'Rufino', 'Rufino', 'Olavi', 'Mady',                      'Barbra', 'Mady', 'Cain', 'Louis', 'Mady', 'Giedrius', 'Barbra'],
     'Louis': ['Placide', 'Cloe', 'Placide', 'Vittorio', 'Placide', 'Rufino', 'Björn', 'Placide', 'Vittorio', 'Giedrius', 'Björn',
              'Rufino', 'Barbra', 'Vittore', 'Vittore', 'Olavi'],
     'Placide': ['Louis', 'Vittorio', 'Louis', 'Faizel', 'Louis', 'Mady', 'Vittorio', 'Rufino', 'Jakob', 'Mady', 'Olavi', 'Olavi',               'Louis', 'Cain', 'Rufino', 'Cloe'],
     'Cloe': ['Björn', 'Vittorio', 'Vittore', 'Teodor', 'Louis', 'Mady', 'Björn', 'Idelle', 'Björn', 'Glenys', 'Barbra', 'Björn',
             'Vittore', 'Björn', 'Idelle', 'Placide'],
     'Björn': ['Cloe', 'Olavi', 'Cloe', 'Cloe', 'Idelle', 'Mady', 'Louis', 'Giedrius', 'Louis', 'Cloe', 'Rufino', 'Faizel',                      'Vittore', 'Teodor', 'Cloe', 'Mady'],
     'Rufino': ['Mady', 'Olavi', 'Giedrius', 'Illtyd', 'Vittorio', 'Placide', 'Vittorio', 'Teodor', 'Olavi', 'Illtyd', 'Faizel',
              'Louis', 'Barbra', 'Björn', 'Barbra', 'Louis', 'Placide', 'Illtyd'],
     'Olavi': ['Rufino', 'Teodor', 'Björn', 'Illtyd', 'Rufino', 'Vittorio', 'Illtyd', 'Barbra', 'Placide', 'Placide', 'Barbra',                 'Teodor', 'Faizel', 'Louis'],
     'Teodor': ['Cloe', 'Olavi', 'Rufino', 'Björn', 'Olavi', 'Mady'],
     'Idelle': ['Mady', 'Cloe', 'Björn', 'Marwa', 'Illtyd', 'Cloe'],
     'Illtyd': ['Giedrius', 'Rufino', 'Olavi', 'Giedrius', 'Rufino', 'Olavi', 'Idelle', 'Rufino'],
     'Glenys': ['Giedrius', 'Cloe'],
     'Jakob': ['Placide', 'Kirsa', 'Kirsa', 'Mady'],
     'Marwa': ['Idelle', 'Barbra'],
     'Cain': ['Vittorio', 'Placide']}
    print('Test ok')
    
dico = create_network(amis)
def test_get_people():
    assert get_people(dico) == ['Alice', 'Bob', 'Charlie', 'Dominique']
    print('Test ok')
    
def test_are_friends():
    assert are_friends(dico, 'Alice', 'Bob') == True
    assert are_friends(dico, 'Dominique', 'Bob') == True
    assert are_friends(dico, 'Alice', 'Charlie') == False
    print('Test ok')
    
def test_all_his_friends():
    assert all_his_friends(dico,"Dominique", ["Alice", "Bob"]) == True
    assert all_his_friends(dico,"Dominique", ["Bob","Alice"]) == True
    assert all_his_friends(dico,"Alice", ["Bob","Charlie"]) == False
    print('Test ok')
    
def test_is_a_community():
    assert is_a_community(dico,["Alice", "Bob", "Dominique"]) == True
    assert is_a_community(dico,["Alice", "Bob", "Charlie"]) == False
    print('Test ok')
    
def test_find_community():
    assert find_community(dico,["Alice", "Bob", "Charlie", "Dominique"]) == ['Alice', 'Bob', 'Dominique']
    assert find_community(dico,["Charlie", "Alice", "Bob", "Dominique"]) == ['Charlie', 'Bob']
    assert find_community(dico,["Charlie", "Alice", "Dominique"]) == ['Charlie']
    print('Test ok')

def test_order_by_decreasing_popularity():
    assert order_by_decreasing_popularity(dico, ["Alice", "Bob", "Charlie"]) == ['Bob', 'Alice', 'Charlie']
    assert order_by_decreasing_popularity(dico, ["Charlie", "Dominique"]) == ['Dominique', 'Charlie']
    print('Test ok')
    
def test_find_community_by_decreasing_popularity():
    assert find_community_by_decreasing_popularity(dico) == ['Alice', 'Bob', 'Dominique']
    print('Test ok')

def test_find_community_from_person():
    assert find_community_from_person(dico, "Alice") == ['Alice', 'Bob', 'Dominique']
    assert find_community_from_person(dico, "Charlie") == ['Charlie', 'Bob']
    assert find_community_from_person(dico, "Bob") == ['Bob', 'Alice', 'Dominique', 'Charlie']
    print('Test ok')
    
def test_find_max_community():
    assert find_max_community(dico) == ['Alice', 'Bob', 'Dominique']
    print('Test ok')

test_list_of_friends()
test_create_network()
test_get_people()
test_are_friends()
test_all_his_friends()
test_is_a_community()
test_find_community()
test_order_by_decreasing_popularity()
test_find_community_by_decreasing_popularity()
test_find_community_from_person()
test_find_max_community()