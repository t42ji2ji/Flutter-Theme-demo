'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "4e05cde45a12818a3ab403e81948948b",
"index.html": "0cba1a2843e3d5a788f3a006d05e8548",
"/": "0cba1a2843e3d5a788f3a006d05e8548",
"main.dart.js": "93d0441073d8126999234190260a5cca",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "b7c274924cfd354c09bbbb35fc2bcd1e",
"assets/AssetManifest.json": "ad0143689571f6092adeffcc0f76a805",
"assets/NOTICES": "d457059f4da52d30e4495230b59e18c7",
"assets/FontManifest.json": "2a55d58088a44ec3260b203616524c7f",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/fonts/MaterialIcons-Regular.otf": "7e7a6cccddf6d7b20012a548461d5d81",
"assets/assets/mock/iphone_14_pro.svg": "26e40f838f780add500fdd0c184f41ea",
"assets/assets/mock/wallet/arbitrum-chain-small.svg": "4a46f14a5f52d886e4ed9a909dbfb764",
"assets/assets/mock/wallet/tron_wallet.svg": "1334d139ef47eecb58b3441dde2cb895",
"assets/assets/mock/wallet/polygon-chain-small.svg": "b0802be70653417269d992d26e5459fd",
"assets/assets/mock/wallet/btc_wallet.svg": "d9d607fbbc8c8236f6275606b4679ade",
"assets/assets/mock/wallet/bitcoin-chain-small.svg": "0c2ad109a3700ecb2c0033435db4faf7",
"assets/assets/mock/wallet/kcc-wallet.svg": "20e8030dd3a62059837b31790c41077d",
"assets/assets/mock/wallet/evm_wallet.svg": "f8fdaa16f1f50fab44f05c3e9dcaa495",
"assets/assets/mock/wallet/kcc-chain-small.svg": "eeafb85b147ec8b44423ee056ae39494",
"assets/assets/mock/wallet/wallet_group.svg": "33d4d601e6477f7f6cb7a603571cf350",
"assets/assets/mock/wallet/solana-chain-small.svg": "321d39fd88bbac863178a81d5f4a699c",
"assets/assets/mock/wallet/protect_wallet_failed.svg": "7b3faffad9f3f3416707183654dea133",
"assets/assets/mock/wallet/arbitrum-wallet.svg": "fa8bcc7e18962a74f7278f265a4dcf2b",
"assets/assets/mock/wallet/ethereum-chain-small.svg": "e6073e6b5bd1ff10d1cd2dfb76a12c85",
"assets/assets/mock/wallet/polygon-wallet.svg": "820a29239d66b66be9c0c9216daf4b5a",
"assets/assets/mock/wallet/solana_wallet.svg": "76714238f8512690c3a904429ca7a1e2",
"assets/assets/mock/wallet/tron-chain-small.svg": "b4b402672b55c07ac64dfc141430e4ad",
"assets/assets/mock/wallet/bsc-chain-small.svg": "b6b6aa640354cf07e3e590baf6647f69",
"assets/assets/mock/wallet/bsc-wallet.svg": "bf5fc97296e54ca50376322ac49d29c1",
"assets/assets/mock/wallet/multi_chain.svg": "2ab40d64ba587339bda21ecb1a9a59a8",
"assets/assets/mock/wallet/protect_wallet.svg": "a1c844f0fad3ee441c235f872248f14a",
"assets/assets/mock/wallet/unprotect_wallet.svg": "5dfe51ea417feba43805b0c134bede91",
"assets/assets/mock/wallet/ethereum-wallet.svg": "c478e8cb733c72a0db3a4429aea830f2",
"assets/assets/mock/wallet/loading_dimond.webp": "f66c3ed0804fab5a1079c63158bf39af",
"assets/assets/fonts/Barlow-Light.ttf": "865a0a175c66fd38550835b6c137d8a9",
"assets/assets/fonts/Barlow-Bold.ttf": "7130fdb0a3f94088119aa0f96db9b08b",
"assets/assets/fonts/Barlow-Medium.ttf": "788f9cc4e37cde7847cd42d30bee07b7",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
