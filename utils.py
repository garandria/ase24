import os
import pandas
import functools

def read_config(config):
    values = dict()
    with open(config, 'r') as stream:
        for line in stream:
            if not line.startswith("#") and line.strip() != '':
                # len("CONFIG_") = 7
                opt, val = line[7:].strip().split('=')
                values[opt] = val
    return values


def diffconfig(c1, c2):
    diff = {"add": dict(), "rm": dict()}
    config1 = read_config(c1)
    config2 = read_config(c2)
    for k, v in config1.items():
        if k not in config2:
            diff["add"][k] = v
    for k, v in config2.items():
        if k not in config1:
            diff["rm"][k] = v
    return diff


def diffsize(c1, c2):
    return functools.reduce(lambda x, y: len(x) + len(y), diffconfig(c1, c2).values())


def diffsize_dir_df(dire):
    data = []
    ltmp = sorted(os.listdir(dire))
    configs = zip(ltmp, ltmp[1:])
    data.append(0)
    for elts in configs:
        a = os.path.join(dire, elts[0])
        b = os.path.join(dire, elts[1])
        data.append(diffsize(a, b))
    return pandas.DataFrame({"diff": data})
