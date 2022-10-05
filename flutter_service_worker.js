'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "android/android-launchericon-144-144.png": "f9e3107fff7baa3d86d2feb7e26f3806",
"android/android-launchericon-192-192.png": "7c96eb862ca33c9fa2eeda4327289b9e",
"android/android-launchericon-48-48.png": "a63d9e948dfe8a14b8f224078cb8d9c1",
"android/android-launchericon-512-512.png": "0bf5fdf07089a3c74cb924ac034a69a7",
"android/android-launchericon-72-72.png": "7829bed9c005254d71ca6711a1d8eb20",
"android/android-launchericon-96-96.png": "0c00b8af8e7ab682fb4ee8433cee7dcb",
"assets/AssetManifest.json": "fdc359f996bbbfcaf97e8207464eeec9",
"assets/assets/audio/payment.wav": "1cecc357d915fcc7a0ae9b8ca9e20899",
"assets/assets/lightning_loading.gif": "a07d20fabdfd93f01a42126233045f58",
"assets/assets/sats.png": "d5d5c603769631742a817e47bf8951b9",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/NOTICES": "1d6b180b3dae6cb8269e69ee3fe2bb82",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/fluttertoast/assets/toastify.css": "a85675050054f179444bc5ad70ffc635",
"assets/packages/fluttertoast/assets/toastify.js": "e7006a0a033d834ef9414d48db3be6fc",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"favicon.png": "519a9f8652fed642efd68cf5012a7da4",
"flutter.js": "eb2682e33f25cd8f1fc59011497c35f8",
"icons/Icon-192.png": "7c96eb862ca33c9fa2eeda4327289b9e",
"index.html": "91e402f06e992a5f60501bbae698866b",
"/": "91e402f06e992a5f60501bbae698866b",
"ios/100.png": "6ec8e331eacd9c79b2f8f87916808103",
"ios/1024.png": "5cc2da2fe8f834838c670b1a27521e6b",
"ios/114.png": "d1d5af15dc22a349cb3707747ad1d103",
"ios/120.png": "00648d4da69e27cf68aac406a970b56d",
"ios/128.png": "d944703c76d74d31559dcff02ef65879",
"ios/144.png": "f9e3107fff7baa3d86d2feb7e26f3806",
"ios/152.png": "acf6e4772de2fc38c2de36a1e8781f49",
"ios/16.png": "519a9f8652fed642efd68cf5012a7da4",
"ios/167.png": "fc62ce5df3501b7a42221d4ada908a9c",
"ios/180.png": "9333c0b1470668725f789f6037087a6f",
"ios/192.png": "7c96eb862ca33c9fa2eeda4327289b9e",
"ios/20.png": "dd4805c24156bb613a87c9f2dc955a66",
"ios/256.png": "40407206c467989c3c3e7542a0870740",
"ios/29.png": "b73c2f8b9d34cd12d4ae87b35115e434",
"ios/32.png": "9c7e72afa9ed52efd21bdbd528c8d8c0",
"ios/40.png": "76ecc152737f2942058aa412c1865688",
"ios/50.png": "2dbf864803d4b43b90e33f8324c4d0c3",
"ios/512.png": "0bf5fdf07089a3c74cb924ac034a69a7",
"ios/57.png": "3380a07b0ee1bdb0f2e9d58d6ff636c8",
"ios/58.png": "fa30ab203db4dc8a6bc1fc13639083fa",
"ios/60.png": "928376cfbaf81a5d1cdd8ac3c96b5561",
"ios/64.png": "949a6e068b0b54ba0583e4b976da5c82",
"ios/72.png": "7829bed9c005254d71ca6711a1d8eb20",
"ios/76.png": "d18800db0955a4cbbb0bbb5c27ca1533",
"ios/80.png": "3babd5bd1b3b7be9d9d0b81285f854cf",
"ios/87.png": "6b10aa399c329bd482e09209ce57542b",
"main.dart.js": "db1860ee363a78ab2f5775f87b8953c1",
"manifest.json": "b7e9e45ba55056d26f87bf0242499d69",
"version.json": "edf49864d56fbd6edf2f7e438b1093f3",
"windows11/LargeTile.scale-100.png": "ec29cbec349ecc8cddd2a83ceed10790",
"windows11/LargeTile.scale-125.png": "ca06094b81696468fae22e1c0c5f5f3d",
"windows11/LargeTile.scale-150.png": "ca68fb90b35f2a2e96267d98c54f82ef",
"windows11/LargeTile.scale-200.png": "e2b3b777d6a93dcc71238faeb34a3407",
"windows11/LargeTile.scale-400.png": "72652d4f9c691fdb9f45a4d9d2cccc69",
"windows11/SmallTile.scale-100.png": "91dc888a86b529232ee99929e90ce6e2",
"windows11/SmallTile.scale-125.png": "3a6e1225b5bba9345d3233e25673e34c",
"windows11/SmallTile.scale-150.png": "007d07bc8b0c38b0f8a6512d8c7b3e98",
"windows11/SmallTile.scale-200.png": "77e40a1633e41825df0e3e84c8956fda",
"windows11/SmallTile.scale-400.png": "fb0790522a19ab5ee618172e35ba80e5",
"windows11/SplashScreen.scale-100.png": "ec8b0c43b82af0ab079dc99cc5521ae6",
"windows11/SplashScreen.scale-125.png": "77a552f724d6c40a195cbef27fb25c7e",
"windows11/SplashScreen.scale-150.png": "ecf59cc087266088bc4b4df61f82bdce",
"windows11/SplashScreen.scale-200.png": "b0c5c7e52af5046c8535529f2344adeb",
"windows11/SplashScreen.scale-400.png": "d2332fd0a93fe0f08a44cf3db0a67b1f",
"windows11/Square150x150Logo.scale-100.png": "e64b411c26f27861f307544c84c247af",
"windows11/Square150x150Logo.scale-125.png": "30254f1664b2a5ba98c0c6bfc8f96808",
"windows11/Square150x150Logo.scale-150.png": "08d152b19a40f2657b093600e61b0217",
"windows11/Square150x150Logo.scale-200.png": "465397adcb8e3bd5e69368f7b4f06091",
"windows11/Square150x150Logo.scale-400.png": "e95262d0d22efa69bad3e86296c1e8ea",
"windows11/Square44x44Logo.altform-lightunplated_targetsize-16.png": "474ad3869598adaa32885fc1c6077800",
"windows11/Square44x44Logo.altform-lightunplated_targetsize-20.png": "451ba7befa91015f49582b2ade15ea57",
"windows11/Square44x44Logo.altform-lightunplated_targetsize-24.png": "33fa7223f6d64490a1e4d6a1b325e36f",
"windows11/Square44x44Logo.altform-lightunplated_targetsize-256.png": "bc239df56448eda7087e6f3bfeea6be9",
"windows11/Square44x44Logo.altform-lightunplated_targetsize-30.png": "18f763eb3a4ed2ef5b05e1e79f8db454",
"windows11/Square44x44Logo.altform-lightunplated_targetsize-32.png": "c01f894bb80c19370fe0342aeb91a184",
"windows11/Square44x44Logo.altform-lightunplated_targetsize-36.png": "4860951e6d733e9fe311142502abc7b9",
"windows11/Square44x44Logo.altform-lightunplated_targetsize-40.png": "4571ce888850c2432bf98ce073d84a72",
"windows11/Square44x44Logo.altform-lightunplated_targetsize-44.png": "19bbe5d8dad093df01c5d505052e99b8",
"windows11/Square44x44Logo.altform-lightunplated_targetsize-48.png": "fd3c55e6880cebf27d4f56e49b80e90f",
"windows11/Square44x44Logo.altform-lightunplated_targetsize-60.png": "6fb1bf06c33d5825612cc60c2de5a124",
"windows11/Square44x44Logo.altform-lightunplated_targetsize-64.png": "7d42339cc7018e15aa7825de1c63c776",
"windows11/Square44x44Logo.altform-lightunplated_targetsize-72.png": "2cf7fe53c09b7f1718bb0e95e675140a",
"windows11/Square44x44Logo.altform-lightunplated_targetsize-80.png": "687c8f034922b3933ba56d06d79f9c21",
"windows11/Square44x44Logo.altform-lightunplated_targetsize-96.png": "61a77318b13c1b716a7caf4b66452568",
"windows11/Square44x44Logo.altform-unplated_targetsize-16.png": "474ad3869598adaa32885fc1c6077800",
"windows11/Square44x44Logo.altform-unplated_targetsize-20.png": "451ba7befa91015f49582b2ade15ea57",
"windows11/Square44x44Logo.altform-unplated_targetsize-24.png": "33fa7223f6d64490a1e4d6a1b325e36f",
"windows11/Square44x44Logo.altform-unplated_targetsize-256.png": "bc239df56448eda7087e6f3bfeea6be9",
"windows11/Square44x44Logo.altform-unplated_targetsize-30.png": "18f763eb3a4ed2ef5b05e1e79f8db454",
"windows11/Square44x44Logo.altform-unplated_targetsize-32.png": "c01f894bb80c19370fe0342aeb91a184",
"windows11/Square44x44Logo.altform-unplated_targetsize-36.png": "4860951e6d733e9fe311142502abc7b9",
"windows11/Square44x44Logo.altform-unplated_targetsize-40.png": "4571ce888850c2432bf98ce073d84a72",
"windows11/Square44x44Logo.altform-unplated_targetsize-44.png": "19bbe5d8dad093df01c5d505052e99b8",
"windows11/Square44x44Logo.altform-unplated_targetsize-48.png": "fd3c55e6880cebf27d4f56e49b80e90f",
"windows11/Square44x44Logo.altform-unplated_targetsize-60.png": "6fb1bf06c33d5825612cc60c2de5a124",
"windows11/Square44x44Logo.altform-unplated_targetsize-64.png": "7d42339cc7018e15aa7825de1c63c776",
"windows11/Square44x44Logo.altform-unplated_targetsize-72.png": "2cf7fe53c09b7f1718bb0e95e675140a",
"windows11/Square44x44Logo.altform-unplated_targetsize-80.png": "687c8f034922b3933ba56d06d79f9c21",
"windows11/Square44x44Logo.altform-unplated_targetsize-96.png": "61a77318b13c1b716a7caf4b66452568",
"windows11/Square44x44Logo.scale-100.png": "19bbe5d8dad093df01c5d505052e99b8",
"windows11/Square44x44Logo.scale-125.png": "cffec0b5bdeb2ad46bdf48622e24f3d0",
"windows11/Square44x44Logo.scale-150.png": "807ba7cc92fce1e61687f186d569917c",
"windows11/Square44x44Logo.scale-200.png": "662f569bb8ce22951bc6bc971d8d5073",
"windows11/Square44x44Logo.scale-400.png": "63fd7166c889dae7bd4a63bab84be405",
"windows11/Square44x44Logo.targetsize-16.png": "474ad3869598adaa32885fc1c6077800",
"windows11/Square44x44Logo.targetsize-20.png": "451ba7befa91015f49582b2ade15ea57",
"windows11/Square44x44Logo.targetsize-24.png": "33fa7223f6d64490a1e4d6a1b325e36f",
"windows11/Square44x44Logo.targetsize-256.png": "bc239df56448eda7087e6f3bfeea6be9",
"windows11/Square44x44Logo.targetsize-30.png": "18f763eb3a4ed2ef5b05e1e79f8db454",
"windows11/Square44x44Logo.targetsize-32.png": "c01f894bb80c19370fe0342aeb91a184",
"windows11/Square44x44Logo.targetsize-36.png": "4860951e6d733e9fe311142502abc7b9",
"windows11/Square44x44Logo.targetsize-40.png": "4571ce888850c2432bf98ce073d84a72",
"windows11/Square44x44Logo.targetsize-44.png": "19bbe5d8dad093df01c5d505052e99b8",
"windows11/Square44x44Logo.targetsize-48.png": "fd3c55e6880cebf27d4f56e49b80e90f",
"windows11/Square44x44Logo.targetsize-60.png": "6fb1bf06c33d5825612cc60c2de5a124",
"windows11/Square44x44Logo.targetsize-64.png": "7d42339cc7018e15aa7825de1c63c776",
"windows11/Square44x44Logo.targetsize-72.png": "2cf7fe53c09b7f1718bb0e95e675140a",
"windows11/Square44x44Logo.targetsize-80.png": "687c8f034922b3933ba56d06d79f9c21",
"windows11/Square44x44Logo.targetsize-96.png": "61a77318b13c1b716a7caf4b66452568",
"windows11/StoreLogo.scale-100.png": "2dbf864803d4b43b90e33f8324c4d0c3",
"windows11/StoreLogo.scale-125.png": "e003ca3ae7459a2488986874eb6294ff",
"windows11/StoreLogo.scale-150.png": "d276809c21865e3eb2831b5f638935c4",
"windows11/StoreLogo.scale-200.png": "6ec8e331eacd9c79b2f8f87916808103",
"windows11/StoreLogo.scale-400.png": "425cb52472a4915e66ac88c0b8d57497",
"windows11/Wide310x150Logo.scale-100.png": "d03bba93129c0e275e170ae4c5abfec0",
"windows11/Wide310x150Logo.scale-125.png": "dacdddffa83a87eeb6bbeb8de7523f5c",
"windows11/Wide310x150Logo.scale-150.png": "ecdd18785907aeb29145aa4982298527",
"windows11/Wide310x150Logo.scale-200.png": "ec8b0c43b82af0ab079dc99cc5521ae6",
"windows11/Wide310x150Logo.scale-400.png": "b0c5c7e52af5046c8535529f2344adeb"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
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
