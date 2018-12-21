// Copyright (C) <2018> Intel Corporation
//
// SPDX-License-Identifier: Apache-2.0
#ifndef OMS_NATIVE_HANDLE_BUFFER_H_
#define OMS_NATIVE_HANDLE_BUFFER_H_
#include "api/video/video_frame_buffer.h"
#include "rtc_base/checks.h"
#include "rtc_base/scoped_ref_ptr.h"
namespace oms {
namespace base {
using namespace webrtc;
class NativeHandleBuffer : public VideoFrameBuffer{
 public:
   NativeHandleBuffer(void* native_handle, int width, int height)
    :native_handle_(native_handle)
    ,width_(width)
    ,height_(height) {}
   Type type() const override { return Type::kNative; }
   int width() const override { return width_; }
   int height() const override { return height_; }
   rtc::scoped_refptr<I420BufferInterface> ToI420() override {
     RTC_NOTREACHED();
     return nullptr;
   }

   void* native_handle() { return native_handle_; }
 private:
   void* native_handle_;
   const int width_;
   const int height_;
};
}  // namespace base
}  // namespace oms
#endif  // OMS_NATIVE_HANDLE_BUFFER_H_
