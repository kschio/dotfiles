#!/usr/bin/osascript -l JavaScript
// Long-running observer: runs theme-sync whenever macOS flips light/dark.
// Launched by io.ksch.theme-sync.plist. Blocks on the run loop, so it costs
// nothing while idle and fires the instant the appearance changes.
ObjC.import('Cocoa');

const SYNC = $.NSHomeDirectory().js + '/.config/theme/theme-sync';

function runSync() {
  const task = $.NSTask.alloc.init;
  task.launchPath = '/bin/sh';
  task.arguments = [SYNC];
  task.launch;
}

// Sync once at launch so login / agent restart lands on the right palette.
runSync();

$.NSDistributedNotificationCenter.defaultCenter.addObserverForNameObjectQueueUsingBlock(
  'AppleInterfaceThemeChangedNotification',
  $(),
  $.NSOperationQueue.mainQueue,
  function () {
    runSync();
  }
);

$.NSRunLoop.mainRunLoop.run();
