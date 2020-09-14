from pywebcopy import save_website
from src.config import Config


class SiteCloner:
    @staticmethod
    def clone(url):
        name = url.split("//")[1]
        kwargs = {"project_name": name}

        save_website(url=url, project_folder=Config.static_path, **kwargs)
