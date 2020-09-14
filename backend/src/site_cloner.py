from src.config import Config

from pywebcopy import WebPage  # save_website
from pywebcopy import config


class SiteCloner:
    @staticmethod
    def scrape(url, folder, timeout=1):
        config.setup_config(url, folder)

        wp = WebPage()
        wp.get(url)

        wp.save_complete()
        for t in wp._threads:
            if t.is_alive():
                t.join(timeout)

        return wp.file_path

    @staticmethod
    def clone(url):
        SiteCloner.scrape(url=url, folder=Config.static_path)
