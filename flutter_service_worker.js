'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "4e05cde45a12818a3ab403e81948948b",
"index.html": "e6f83633d4c1b859f0bcbbc6ea8fec13",
"/": "e6f83633d4c1b859f0bcbbc6ea8fec13",
"main.dart.js": "93d0441073d8126999234190260a5cca",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "b7c274924cfd354c09bbbb35fc2bcd1e",
".git/config": "c61c86d54b9af6f5461baaee7c782d98",
".git/objects/0d/0df08f7c3e147a8ae36017cf81a96e35b73717": "106e868f28a72727fb6fb0fa71123633",
".git/objects/50/2d48f3af5588a0eb6bed89bf190cc7106a9279": "266b0db940a83c5210a5e5d29e6164ba",
".git/objects/6f/e3242b4cb0ee2cb809c9a53ab69252e7319ca1": "e999149a0c795d337d6a97437d11937d",
".git/objects/69/fa22b67797a199e023aa592e2523305d19516e": "e35b91c0bf2bd250c07da76b0c605bf3",
".git/objects/02/1a3e76a3ab013a28e74b40eaf24b5b082175ed": "2be22b689758f5d8e36692390f496cbc",
".git/objects/b2/f056fd2225ceec3ef3d93dc385189e2612bad6": "98a072f17991b6d3cf1f08594ed9381f",
".git/objects/ad/c52a5072edc37d24b3743d4f966281343f22aa": "e48ec9f60d3182c2a8accfe0f8490ae6",
".git/objects/ad/9fc4bbdc2dd3896283225f2231d682c8e90815": "f9310cd1f4474c4c64621c985bdf8b51",
".git/objects/da/c2387d87b9bbeece0e533694c613fafe746e64": "467c4f63ae3c67b0015d9bd4797d3efd",
".git/objects/da/e6f350e6d266a635f233edb530eade2d6e33d2": "30422ef7d434dac158b86d1426e1b9fa",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/ab/0e98497a51ead7821d1da35a24968ff314e50f": "557c35fe3928eb2af403d1b3926bb9ba",
".git/objects/e5/951dfb943474a56e611d9923405cd06c2dd28d": "c6fa51103d8db5478e1a43a661f6c68d",
".git/objects/f4/29303aa183c583c48647c8ce2c157073703c96": "5d00bf442950394c9b3c3302a8559944",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/c7/35290a0d22a5e7d213c430a1a5a31d3b0d8e24": "dbc4c7d5ca9f9b45775cbf0250ba3f54",
".git/objects/e3/1f220f47eeeb78b95e3d7416022276c57681dc": "abfe464301e5aa04a1a41d9efd68f552",
".git/objects/c1/54176355e0f78b19bf692c612fcff4be8a4b82": "4e800af59e8bf1f5ee68b8b703c64510",
".git/objects/4e/89617a3696bd10c155ec378f4a65a9f89e9e3a": "d8056e20bae90d092b619c895129e982",
".git/objects/18/067831eb79e50d7eb0beace79fbf20df02fa11": "fb1fb0ae26a840fb74dbebd96c953809",
".git/objects/7d/ba83c9646da248f4e24e6f8c6e95843b6366f4": "60011f45eddc4a3e1d3ab0e5bede89c6",
".git/objects/74/b6f5c1bb8db94d96a90c8452c9213f7d6a8e15": "ece06f534343f0d6da08bdf16ef564e8",
".git/objects/8f/b683fc3d553d90478d50476298d352df13c4df": "1dbba6bd4d4f052cebf2b499049fe36c",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/19/1345f220caf09dbcbfe7f84a4e5b7f506d6aca": "8cba7eb5d59d01d7b057eb6d5dc7b87b",
".git/objects/21/dbe42730f52176e16805e3b9ee21efe3b561a9": "73075a45cd6c0726c136938744075fe7",
".git/objects/4d/ecd3f990c63412413de8790bb20f792309b77b": "b2eba9ffeaac82a54d0154bd8c1980ae",
".git/objects/86/d6a79c4eb8629e5631b391f194dc5a6d928892": "76465b433815fa3bc7731bd3f3b2d5fc",
".git/objects/86/f237c6dadf41e4a287b23fce1db84d04115655": "ee24a26917034e7c59eda53ae8ee0f4c",
".git/objects/44/dc0b96dd7f00bc615ff93bae64aaf642728352": "88438d6fe77151d14de2720f72cf97d6",
".git/objects/2f/4f134068d610bd0fcfb01275e33bf2f1140030": "8ebc13593e559ecce21f9dc82d37033e",
".git/objects/2f/4a7a39c9e158766fea76b6fd447f36e482755d": "d6de4d93d8f906dddef6ce7028b8958b",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/07/8779018db9bfbb971ecb94f7e398f9e55508f0": "242a348643f1b095000d540d705ac5ce",
".git/objects/09/f8d5a21e6e0997e7d0054a70a6712f69e68bd6": "0511880926588cce58d6f14fbe9fae15",
".git/objects/65/bebba883b2a73deaa2d4472a481a6c60ffd01c": "cb94a7e97805e7e34288faf3f986f8a5",
".git/objects/53/c35e8917391154cb2145f2d9ea76f43289a813": "244e57d9501fabdf60796856e3de4a5e",
".git/objects/37/053b08c07f866ccda78cad452d58ae70ade4f0": "37a2fcee05161997a73ec208e69f1f35",
".git/objects/39/7d583c3be7aeae6a2d98d9e492c7a5f982b68c": "8bf45aca6e0807f06754216aa64aaabb",
".git/objects/52/480a63b1f184ea74afb06662aa98fa98864864": "6f8b2cf71be2b4830601f9db57eded45",
".git/objects/55/1d9d03b7dde39956ab9b0ac83b1d57f4424a92": "b7ea0adb788cfd2ba99e41c6906a9b5c",
".git/objects/97/ce8ade4139f226c80408d64d180d0364f5f72a": "606c91208378cd2f0d679e8fe0523195",
".git/objects/97/94dc095910f98928c5ff7ee1030677b174845a": "945195f113e8466f8854ef2eaccd8b78",
".git/objects/63/8751116f2c5d4fed814cd2664c1f06e2148f00": "d9eb7e6ed86643e1e013cf98c30e62e7",
".git/objects/90/c9da2d7bceced421753644c2f23f3f4e8da0bd": "48bb4afde3bf6cea6057b1673dd2c48b",
".git/objects/a7/575c7e4c9b1bbc203870438d27d940e644e472": "92ab4a1ec109d377af8c5b2bf87cd989",
".git/objects/b1/3ba63f89b0cb87bba3b5a80be6b10174b737ed": "4c11b2c36bcf75689ad35b1b03b748e4",
".git/objects/dc/072e91c53d800804f365b2d1724b031d5d47a3": "b9ae7d14f4419657f04d7d5de35869fd",
".git/objects/af/bebc4bf7bf8d86d6e0e4194e8ad8d063a80569": "247232416e859773f81f7d941aa7c6e1",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b0/58f9bc307397397a74151ee9edc98034edbdf9": "c46fa80630bb8ae39466a66b93071f8f",
".git/objects/b0/31700fce73b763897871a9962afb6e93ef3194": "8d94331d322ae97da950d28a2ae361c0",
".git/objects/a6/f71f27f771d96f1ef5b347746715bf545d9d62": "44bbe65306d31929681000e47d79ba89",
".git/objects/a6/ad44d3d3680004ece8365b02d463b12248fff7": "cfda87ac8c3fe0c86965e12d44faa952",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/a1/3837a12450aceaa5c8e807c32e781831d67a8f": "bfe4910ea01eb3d69e9520c3b42a0adf",
".git/objects/c3/a3d3d3283e2313751080267db96ab2f65e7d0a": "473c5069b097732ecb8993aa4ae46815",
".git/objects/f9/6b21a9cc99a9b3752e59860f8a60b92755342c": "f91ae919755ab7cc52d039bccac392c8",
".git/objects/f0/95e2f8567576dbe859c13f0a94e8276dd8e3fc": "68712971d0673c99e2e4715e44da71d7",
".git/objects/fa/489252c617c0b249e4987c0daf09f75acb63c7": "93838f49ea74a3d01bed056c95c2244f",
".git/objects/c2/f433ef1f1465ef260668874310e9a7766150bd": "b84946418148c4c555c9f51c0761467c",
".git/objects/c2/7c95863c7c1bb330971bfa149327c7633e265e": "0850e3c6bfd619c0b5bef84b70ca5fb6",
".git/objects/e9/e575d0b36ebd696294496017834c26b62e1505": "8eca52e53d59927cc7c00a13888ea67b",
".git/objects/79/ba7ea0836b93b3f178067bcd0a0945dbc26b3f": "f3e31aec622d6cf63f619aa3a6023103",
".git/objects/2d/cf3542c874e33cd8ab86ceb6f0ec444228aa78": "66baad0ae5d874f09b6eee790095bc65",
".git/objects/2d/23d1fcf73a552cc3d073a05f82c18558ef1d34": "1cce81578f6a4a2bb08e6c1d0a40744c",
".git/objects/24/144736688e081a770dd5599eac5db6f51caac4": "25c03559261b432b7b91ca3689948902",
".git/objects/24/ad660a4ae579f4197b52791278bc975771ecbb": "09ecbd6ad36b00789a7de0e653931bec",
".git/objects/24/b1f14dd348b07c9b8373758bde9ac14d16fd92": "dbf45d6c044044561758a334420e9569",
".git/objects/8d/595bfb584fd2ffa08e913bae707cf57eac1b32": "5dbbf6515a567a216d0da2be477c1ec3",
".git/objects/1d/f966883c92538aa9bcfebc828973f35163f38b": "3b06009e01e689068655a8f6310fbe50",
".git/objects/71/0f882c1c13c6f1e7c6c9a246bd76d97032501b": "728d73d080ef54cd12c271637471551e",
".git/objects/76/1099349e7cfca8c0c31d2819aa07fb97970885": "ef90300e3a57c8f7cf50afef2772b7d1",
".git/objects/76/8651b2e249c2517c7b37bdbeea0a5d8bfbb707": "495b1c4fefa633f6afe4dc5840ebe18f",
".git/objects/1c/a5fcae28af3411cd2b4cc91f39e389b84ffb3d": "e0eb48a77b2aa221669631dba8605002",
".git/objects/2e/829415c4fd2c30e8a58ea1b3fe3fcb8a7aabf5": "460cc49398ade3eff1238ad3068dd307",
".git/objects/13/1644925d1e1bf273dac32a4da2fe4ca5b3f897": "e0929904a1a61e002c89cc616ddf1f8e",
".git/HEAD": "5ab7a4355e4c959b0c5c008f202f51ec",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "cdad394affcd6b9d7cf4260a7c8b5b4a",
".git/logs/refs/heads/gh-pages": "d45b6bfffb02d652eaa4c714e85b11ec",
".git/logs/refs/heads/main": "c06fe5971fb7ac2480f60da25401f062",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-commit.sample": "305eadbbcd6f6d2567e033ad12aabbc4",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/fsmonitor-watchman.sample": "ea587b0fae70333bce92257152996e70",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/refs/heads/gh-pages": "5c2b3a70661d53540eb4fabd8da8c123",
".git/refs/heads/main": "d071515b4ec4ecf49422ff245b31f9ec",
".git/index": "0a23f1e53d6269833a432d8a702dbea4",
".git/COMMIT_EDITMSG": "45c9eb7fa6e6a781268f8a3b8d62d8b9",
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
