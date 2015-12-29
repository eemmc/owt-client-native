//
//  Copyright (c) 2015 Intel Corporation. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import "talk/app/webrtc/objc/public/RTCMediaConstraints.h"
#import "talk/app/webrtc/objc/public/RTCVideoCapturer.h"
#import "talk/app/webrtc/objc/RTCMediaStream+Internal.h"
#import "talk/app/webrtc/objc/RTCVideoCapturer+Internal.h"
#import "talk/woogeen/sdk/base/objc/public/RTCLocalCameraStream.h"
#import "talk/woogeen/sdk/base/objc/RTCLocalCameraStreamParameters+Internal.h"
#import "talk/woogeen/sdk/base/objc/RTCStream+Internal.h"
#import "talk/woogeen/sdk/base/objc/RTCLocalStream+Internal.h"
#import "talk/woogeen/sdk/base/objc/RTCPeerConnectionDependencyFactory.h"

#include "talk/woogeen/sdk/include/cpp/woogeen/base/stream.h"

@implementation RTCLocalCameraStream

- (instancetype)initWithParameters:(RTCLocalCameraStreamParameters*)parameters {
  self = [super init];
  woogeen::base::LocalCameraStreamParameters local_parameters =
      *[parameters nativeParameters].get();
  std::shared_ptr<woogeen::base::LocalCameraStream> local_stream =
      std::make_shared<woogeen::base::LocalCameraStream>(local_parameters);
  [super setNativeStream:local_stream];
  return self;
}

@end
