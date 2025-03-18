##############
# SAE S01.01 #
##############

def liste_amis(amis, prenom):
    """
        Retourne la liste des amis de prenom en fonction du tableau amis.
    """
    prenoms_amis = []
    i = 0
    while i < len(amis)//2:
        if amis[2 * i] == prenom:
            prenoms_amis.append(amis[2*i+1])
        elif amis[2*i+1] == prenom:
            prenoms_amis.append(amis[2*i])
        i += 1
    return prenoms_amis

def nb_amis(amis, prenom):
    """ Retourne le nombre d'amis de prenom en fonction du tableau amis. """
    return len(liste_amis(amis, prenom))


def personnes_reseau(amis):
    """ Retourne un tableau contenant la liste des personnes du réseau."""
    people = []
    i = 0
    while i < len(amis):
        if amis[i] not in people:
            people.append(amis[i])
        i += 1
    return people

def taille_reseau(amis):
    """ Retourne le nombre de personnes du réseau."""
    return len(personnes_reseau(amis))

def lecture_reseau(path):
    """ Retourne le tableau d'amis en fonction des informations contenues dans le fichier path."""
    f = open(path, "r")
    l = f.readlines()
    f.close()
    amis = []
    i = 0
    while i < len(l):
        fr = l[i].split(";")
        amis.append(fr[0].strip())
        amis.append(fr[1].strip())
        i += 1
    return amis

def dico_reseau(amis):
    """ Retourne le dictionnaire correspondant au réseau."""
    dico = {}
    people = personnes_reseau(amis)
    i = 0
    while i < len(people):
        dico[people[i]] = liste_amis(amis, people[i])
        i += 1
    return dico

def nb_amis_plus_pop (dico_reseau):
    """ Retourne le nombre d'amis des personnes ayant le plus d'amis."""
    personnes = list(dico_reseau)
    maxi = len(dico_reseau[personnes[0]])
    i = 1
    while i < len(personnes):
        if maxi < len(dico_reseau[personnes[i]]):
            maxi = len(dico_reseau[personnes[i]])
        i += 1
    return maxi


def les_plus_pop (dico_reseau):
    """ Retourne les personnes les plus populaires, c'est-à-dire ayant le plus d'amis."""
    max_amis = nb_amis_plus_pop(dico_reseau)
    most_pop = []
    personnes = list(dico_reseau)
    i = 1
    while i < len(personnes):
        if len(dico_reseau[personnes[i]]) == max_amis:
            most_pop.append(personnes[i])
        i += 1
    return most_pop

##############
# SAE S01.02 #
##############
def list_of_friends(path):
    """Retourne un tableau de couples d'amis."""
    f = open(path, "r")
    l = f.readlines()
    f.close()
    amis = [] #On crée un tableau vide
    i = 0
    # On va parcourir toutes les lignes 
    while i < len(l): 
        fr = l[i].split(";")
        # On va ajouter p1 et p2 de chaque ligne
        amis.append(fr[0].strip()) 
        amis.append(fr[1].strip())
        i += 1
    return amis # On retourne le tableau

def create_network(amis):
    """ Retourne le dictionnaire correspondant au réseau."""
    dico = {} # On crée un dictionnaire vide
    i = 0  
    while i < len(amis):
        if amis[i] not in list(dico) and not i%2: # Si amis[i] n'est pas dans les clés du dico et que i est pair
            dico[amis[i]] = [amis[i+1]] # On ajoute amis[i] en clé et son i+1 en valeur dans dico
        elif amis[i] not in list(dico) and i%2 : # Si amis[i] n'est pas dans les clés du dico et que i est impair
            dico[amis[i]] = [amis[i-1]] # On ajoute amis[i] en clé et son i-1 en valeur dans dico
        elif amis[i] in list(dico) and not i%2:# Si amis[i] est dans les clés du dico et que i est pair
            dico[amis[i]].append(amis[i+1]) # On ajoute son i+1 dans ses valeurs
        else: 
            dico[amis[i]].append(amis[i-1]) # On ajoute son i-1 dans ses valeurs
        i += 1
    return dico # On retourne dico

def get_people(network):
    """ Retourne un tableau contenant la liste des personnes du réseau."""
    
    return list(network) 

def are_friends(network, person1, person2):
    """ Retourne si deux personnes sont amies ou non."""
    i = 0
    # On va parcourir le tableau des amis de person1
    while i < len(network[person1]):
        # On va vérifier si la person2 se trouve dans les amis de person1
        if network[person1][i] == person2: 
            return True
        i += 1
    return False

def all_his_friends(network, person, group):
    """ Retourne True ou False si la personne est amie avec toutes les personnes du groupe."""
    i = 0
    # On va parcourir le tableau group
    while i < len(group):
        # On va vérifier si la person est ami avec toutes les personnes dans group
        if are_friends(network,person, group[i]):
                i +=1
        else:
            return False
    return True

def is_a_community(network, group):
    """ Retourne True ou False si toutes les personnes sont amies dans le groupe ."""
    person = group[0] # On va prendre la première personne du group
    tab = [] # On crée un tableau vide
    i = 1
    while i < len(group):
        # On ajoute le reste dans tab
        tab.append(group[i])
        i += 1
    # On vérifie si la première personne du group est ami avec tout le monde
    if all_his_friends(network, person, tab):
        return True
    else:
        return False
    
def find_community(network, group):
    """ Retourne une communauté en fonction de l'heuristique décrite si-dessous:
    
    - On part d'une communauté vide.
    - On considère les personnes les unes après les autres. Pour chacune des personnes, si celle-ci est amie avec tous les membres
      de la communauté déjà créée, alors on l'ajoute à la communauté.
    
    """
    tab = [] # On crée un tableau vide
    person = group[0]
    tab.append(person) # On ajoute la première personne du group dans tab
    i = 1
    # On parcourt group en commençant par la deuxième personnes
    while i < len(group):
        # On vérifie si group[i] est ami avec person
        if are_friends(network, person, group[i]): # si elles sont amies alors on l'ajoute dans tab
            tab.append(group[i])
        i += 1
    return tab

def order_by_decreasing_popularity(network, group):
    """ Retourne un tableau trié par le nombre d'amis de chaque personne du groupe."""
    tab = [] # On crée un tableau vide
    i = 0
    max = 0
    # On va déterminer le nombre d'amis max qu'une personne peut avoir
    while i < len(group):
        if max < len(network[group[i]]):
            max = len(network[group[i]])
        i += 1
    while max != 0 :
        j = 0
        # On regarde si le nombre d'amis de chaque personne est égal au max
        while j < len(group):
            # Si le nombre d'amis de group[j] est égal au max
            if len(network[group[j]]) == max:
                tab.append(group[j]) # On l'ajoute dans le tableau
            j += 1
        # Si on a parcouru tout le tableau alors on fait -1 dans max
        max -= 1
    return tab

def find_community_by_decreasing_popularity(network):
    """
    La fonction va trier l'ensemble des personnes du réseau selon sa popularité puis retourner la
    communauté trouvée en appliquant l'heuristique de construction de communauté maximale expliquée plus haut.
    
    """
    a = get_people(network) # On affecte à 'a' le tableau de la liste des personnes du réseau
    group = order_by_decreasing_popularity(network, a) # On trie le tableau 'a' selon la popularité
    tab = []
    tab.append(a[0]) # On ajoute a[0] dans tab
    i = 0
    while i < len(group):
        # On vérifie si tab[0] est amie avec les personnes dans le tableau trié
        if are_friends(network, tab[0], group[i]): #Si group[i] est amie avec tab[0] alors on l'ajoute dans tab
            tab.append(group[i])
        i += 1
    return tab

def find_community_from_person(network, person):
    """ Retourne une communauté maximale contenant cette personne selon l'heuristique décrite ci-dessous:
    
    - on choisit une personne du réseau,
    - on crée une communauté contenant juste cette personne,
    - on considère les amis de cette personne par ordre de popularité décroissante. Pour chacune de ces personnes, si celle-ci est
      amie avec tous les membres de la communauté déjà créée, alors on l'ajoute à la communauté.
    
    """
    tab = [] # On crée un tableau vide
    tab.append(person) # On ajoute person dans tab
    a = get_people(network) # On affecte à 'a' le tableau de la liste des personnes du réseau
    group = order_by_decreasing_popularity(network, a) # On trie le tableau 'a' selon la popularité
    i = 0
    while i < len(group):
        # On ajoute toutes les personnes du tableau trié sauf person 
        if group[i] != person :
            tab.append(group[i])
        i += 1
    # On enlève les personnes qui sont pas amis avec person et on retourne le tableau
    return find_community(network, tab)

def find_max_community(network):
    """ Retourne la plus grande communauté trouvée."""
    
    person = get_people(network) 
    return find_community_from_person(network, person[0])