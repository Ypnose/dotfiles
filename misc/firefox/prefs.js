/* -----------------------------------------------------------------+ */
/* file:     prejs.js (Mozilla Firefox)                             + */
/* author:   Ypnose - http://ywstd.fr                               + */
/* -----------------------------------------------------------------+ */

/* Put this file in .mozilla/firefox/XXXXXXXX.foo/, when Firefox is
   turned off. It will "enforce" a few parameters. */

user_pref("accessibility.blockautorefresh", true);
user_pref("browser.cache.disk.parent_directory", "/tmp/firefox-cache");
user_pref("browser.cache.offline.capacity", 0);
user_pref("browser.cache.offline.enable", false);
user_pref("browser.download.manager.showWhenStarting", false);
user_pref("browser.formfill.enable", false);
user_pref("browser.fullscreen.autohide", false);
user_pref("browser.newtabpage.enabled", false);
user_pref("browser.pagethumbnails.capturing_disabled", true);
user_pref("browser.pocket.enabled", false);
user_pref("browser.pocket.api", "");
user_pref("browser.pocket.site", "");
user_pref("browser.pocket.oAuthConsumerKey", "");
user_pref("browser.search.defaultenginename", "DuckDuckGo");
user_pref("browser.search.selectedEngine", "DuckDuckGo");
user_pref("browser.search.suggest.enabled", false);
user_pref("browser.slowStartup.notificationDisabled", true);
user_pref("browser.startup.homepage", "https://duckduckgo.com/");
user_pref("browser.startup.page", 3);
user_pref("browser.urlbar.autocomplete.enabled", false);
user_pref("browser.urlbar.suggest.bookmark", false);
user_pref("browser.urlbar.suggest.history", false);
user_pref("browser.urlbar.suggest.openpage", false);
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("dom.battery.enabled", false);
user_pref("dom.event.clipboardevents.enabled", false);
/* user_pref("dom.storage.enabled", false); */
user_pref("general.smoothScroll", false);
user_pref("geo.enabled", false);
user_pref("geo.wifi.uri", "http://127.0.0.1");
user_pref("layers.acceleration.disabled", true);
user_pref("loop.enabled", false);
user_pref("loop.server", "");
user_pref("media.peerconnection.enabled", false);
user_pref("network.cookie.cookieBehavior", 2);
user_pref("network.cookie.lifetimePolicy", 0);
user_pref("network.dns.disablePrefetch", true);
user_pref("places.history.enabled", false);
user_pref("plugin.state.flash", 1);
user_pref("privacy.clearOnShutdown.offlineApps", true);
user_pref("privacy.donottrackheader.enabled", true);
user_pref("privacy.sanitize.sanitizeOnShutdown", true);
user_pref("privacy.trackingprotection.enabled", true);
user_pref("signon.rememberSignons", false);
