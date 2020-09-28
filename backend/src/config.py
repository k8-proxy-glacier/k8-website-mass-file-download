import os


def get_envar(k):
    val = os.environ.get(k, None)
    if not val:
        exit(f"{k} not supplied")  # ""
    return val


class Config(object):
    DEBUG = True
    static_path = get_envar("STATIC_PATH")
