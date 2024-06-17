import json
with open("/home/sushi/Desktop/work/Azure/location_availability/eastus-sku.json", "r") as f:
    l1 = json.load(f)
l2 = list(l1)
l2 = list(filter(lambda x : x["restrictions"] == [], l2))
list_dict =[[0,0,0]]
k = 0
for i in range(len(l2)):
    try :
        for j in l2[i]["capabilities"]:
            if j['name'] == 'vCPUs':
                list_dict[k][1] = j['value']
            if j['name'] == 'MemoryGB' or j['name'] == 'MemoryMB':
                list_dict[k][2] = j['value']
        if list_dict[k][1] != 0 :
            list_dict[k][0] = l2[i]['name']
            list_dict.append([0,0,0])
            k += 1
    except :
        None
list_dict = list_dict[:len(list_dict)-1]
list_dict = sorted(list_dict, key = lambda x : float(x[2]))
list_dict = sorted(list_dict, key = lambda x : int(x[1]))
with open("/home/sushi/Desktop/work/Azure/location_availability/selection.json", "w") as file:
    json.dump(list_dict , file, indent=4, sort_keys=True)
