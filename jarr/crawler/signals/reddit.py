import re
import logging
from bs4 import BeautifulSoup
from .base import entry_parsing


REDDIT_FEED = re.compile(r'^https?://www.reddit.com/r/\S+/.rss$')
logger = logging.getLogger(__name__)


@entry_parsing.connect
def reddit_integration(sender, feed, entry):
    is_reddit_feed = bool(feed.integration_reddit
                          and REDDIT_FEED.match(feed.link))
    has_sufficient_data = bool(len(entry.get('content', []))
                               and entry['content'][0].get('value'))
    if not is_reddit_feed or not has_sufficient_data:
        return

    content = BeautifulSoup(entry['content'][0]['value'], 'html.parser')
    try:
        link, comments = content.find_all('a')[-2:]
    except Exception:
        logger.warning('failed to parse %r', entry)
        return
    entry['tags'] = []  # reddit tags are irrelevant, removing them
    if link.text != '[link]' or comments.text != '[comments]':
        return
    entry['link'] = link.attrs['href']
    entry['comments'] = comments.attrs['href']
    if entry['link'] == entry['comments']:
        del entry['comments']
    return
