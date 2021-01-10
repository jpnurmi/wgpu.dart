import 'dart:ffi' as ffi;
import 'dart:typed_data';

import 'package:ffi/ffi.dart';

import 'bindings.dart';
import 'enums.dart';

class _WGPUType<T extends ffi.NativeType> {
  final ffi.Pointer<T> _ptr;

  _WGPUType(this._ptr) : assert(_ptr != ffi.nullptr);

  ffi.Pointer<T> toNative() => _ptr;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is _WGPUType && _ptr == other._ptr;
  }

  @override
  int get hashCode => _ptr.hashCode;

  @override
  String toString() => '$runtimeType($_ptr)';
}

class CAdapterInfo extends _WGPUType<WGPUCAdapterInfo> {
  CAdapterInfo.fromNative(ffi.Pointer<WGPUCAdapterInfo> ptr) : super(ptr);

  WGPUCAdapterInfo get _ref => _ptr.ref;

  /// Adapter name
  String get name => Utf8.fromUtf8(_ref.name.cast(), length: _ref.name_length);

  /// Vendor PCI id of the adapter
  int get vendor => _ref.vendor;

  /// PCI id of the adapter
  int get device => _ref.device;

  /// Type of device
  DeviceType get deviceType => DeviceType.values[_ref.device_type];

  /// Backend used for device
  Backend get backend => Backend.values[_ref.backend];
}

class ChainedStruct extends _WGPUType<WGPUChainedStruct> {
  ChainedStruct.fromNative(ffi.Pointer<WGPUChainedStruct> ptr) : super(ptr);
}

class CLimits extends _WGPUType<WGPUCLimits> {
  CLimits.fromNative(ffi.Pointer<WGPUCLimits> ptr) : super(ptr);

  WGPUCLimits get _ref => _ptr.ref;

  int get maxBindGroups => _ref.max_bind_groups;
}

class ComputePass extends _WGPUType<WGPUComputePass> {
  ComputePass.fromNative(ffi.Pointer<WGPUComputePass> ptr) : super(ptr);
}

class ComputePassDescriptor extends _WGPUType<WGPUComputePassDescriptor> {
  ComputePassDescriptor.fromNative(ffi.Pointer<WGPUComputePassDescriptor> ptr)
      : super(ptr);

  WGPUComputePassDescriptor get _ref => _ptr.ref;

  int get todo => _ref.todo;
}

/// RGBA double precision color.
///
/// This is not to be used as a generic color type, only for specific wgpu interfaces.
class Color extends _WGPUType<WGPUColor> {
  Color.fromNative(ffi.Pointer<WGPUColor> ptr) : super(ptr);

  /// ### TODO: replace with dart:ui Color?
  WGPUColor get _ref => _ptr.ref;

  double get red => _ref.r;
  double get green => _ref.g;
  double get blue => _ref.b;
  double get alpha => _ref.a;
}

class Option_BufferSize extends _WGPUType<WGPUOption_BufferSize> {
  Option_BufferSize.fromNative(ffi.Pointer<WGPUOption_BufferSize> ptr)
      : super(ptr);
}

/// Describes an individual channel within a render pass, such as color, depth, or stencil.
class PassChannel_Color extends _WGPUType<WGPUPassChannel_Color> {
  PassChannel_Color.fromNative(ffi.Pointer<WGPUPassChannel_Color> ptr)
      : super(ptr);

  WGPUPassChannel_Color get _ref => _ptr.ref;

  /// Operation to perform to the output attachment at the start of a renderpass. This must be clear if it
  /// is the first renderpass rendering to a swap chain image.
  LoadOp get loadOp => LoadOp.values[_ref.load_op];

  /// Operation to perform to the output attachment at the end of a renderpass.
  StoreOp get storeOp => StoreOp.values[_ref.store_op];

  /// If load_op is [`LoadOp::Clear`], the attachement will be cleared to this color.
  Color get clearValue => Color.fromNative(_ref.clear_value.addressOf);

  /// If true, the relevant channel is not changed by a renderpass, and the corresponding attachment
  /// can be used inside the pass by other read-only usages.
  bool get readOnly => _ref.read_only != 0;
}

class RenderBundleEncoder extends _WGPUType<WGPURenderBundleEncoder> {
  RenderBundleEncoder.fromNative(ffi.Pointer<WGPURenderBundleEncoder> ptr)
      : super(ptr);
}

class RenderPass extends _WGPUType<WGPURenderPass> {
  RenderPass.fromNative(ffi.Pointer<WGPURenderPass> ptr) : super(ptr);
}

/// Describes a color attachment to a [`RenderPass`].
// class WGPURenderPassColorAttachmentDescriptorBase_TextureViewId
//     extends ffi.Struct {
class RenderPassColorAttachmentDescriptorBase_TextureViewId extends _WGPUType<
    WGPURenderPassColorAttachmentDescriptorBase_TextureViewId> {
  RenderPassColorAttachmentDescriptorBase_TextureViewId.fromNative(
      ffi.Pointer<WGPURenderPassColorAttachmentDescriptorBase_TextureViewId>
          ptr)
      : super(ptr);

  WGPURenderPassColorAttachmentDescriptorBase_TextureViewId get _ref =>
      _ptr.ref;

  /// Texture attachment to render to. Must contain [`TextureUsage::OUTPUT_ATTACHMENT`].
  int get attachment => _ref.attachment;

  /// MSAA resolve target. Must contain [`TextureUsage::OUTPUT_ATTACHMENT`]. Must be `None` if
  /// attachment has 1 sample (does not have MSAA). This is not mandatory for rendering with multisampling,
  /// you can choose to resolve later or manually.
  int get resolve_target => _ref.resolve_target;

  /// Color channel.
  PassChannel_Color get channel =>
      PassChannel_Color.fromNative(_ref.channel.addressOf);
}

/// Describes an individual channel within a render pass, such as color, depth, or stencil.
class PassChannel_f32 extends _WGPUType<WGPUPassChannel_f32> {
  PassChannel_f32.fromNative(ffi.Pointer<WGPUPassChannel_f32> ptr) : super(ptr);

  WGPUPassChannel_f32 get _ref => _ptr.ref;

  /// Operation to perform to the output attachment at the start of a renderpass. This must be clear if it
  /// is the first renderpass rendering to a swap chain image.
  LoadOp get loadOp => LoadOp.values[_ref.load_op];

  /// Operation to perform to the output attachment at the end of a renderpass.
  StoreOp get storeOp => StoreOp.values[_ref.store_op];

  /// If load_op is [`LoadOp::Clear`], the attachement will be cleared to this color.
  double get clearValue => _ref.clear_value;

  /// If true, the relevant channel is not changed by a renderpass, and the corresponding attachment
  /// can be used inside the pass by other read-only usages.
  bool get readOnly => _ref.read_only != 0;
}

/// Describes an individual channel within a render pass, such as color, depth, or stencil.
class PassChannel_u32 extends _WGPUType<WGPUPassChannel_u32> {
  PassChannel_u32.fromNative(ffi.Pointer<WGPUPassChannel_u32> ptr) : super(ptr);

  WGPUPassChannel_u32 get _ref => _ptr.ref;

  /// Operation to perform to the output attachment at the start of a renderpass. This must be clear if it
  /// is the first renderpass rendering to a swap chain image.
  LoadOp get loadOp => LoadOp.values[_ref.load_op];

  /// Operation to perform to the output attachment at the end of a renderpass.
  StoreOp get storeOp => StoreOp.values[_ref.store_op];

  /// If load_op is [`LoadOp::Clear`], the attachement will be cleared to this color.
  int get clearValue => _ref.clear_value;

  /// If true, the relevant channel is not changed by a renderpass, and the corresponding attachment
  /// can be used inside the pass by other read-only usages.
  bool get readOnly => _ref.read_only != 0;
}

/// Describes a depth/stencil attachment to a [`RenderPass`].
class RenderPassDepthStencilAttachmentDescriptorBase_TextureViewId
    extends _WGPUType<
        WGPURenderPassDepthStencilAttachmentDescriptorBase_TextureViewId> {
  RenderPassDepthStencilAttachmentDescriptorBase_TextureViewId.fromNative(
      ffi.Pointer<
              WGPURenderPassDepthStencilAttachmentDescriptorBase_TextureViewId>
          ptr)
      : super(ptr);

  WGPURenderPassDepthStencilAttachmentDescriptorBase_TextureViewId get _ref =>
      _ptr.ref;

  /// Texture attachment to render to. Must contain [`TextureUsage::OUTPUT_ATTACHMENT`] and be a valid
  /// texture type for a depth/stencil attachment.
  int get attachment => _ref.attachment;

  /// Depth channel.
  PassChannel_f32 get depth => PassChannel_f32.fromNative(_ref.depth.addressOf);

  /// Stencil channel.
  PassChannel_u32 get stencil =>
      PassChannel_u32.fromNative(_ref.stencil.addressOf);
}

class RenderPassDescriptor extends _WGPUType<WGPURenderPassDescriptor> {
  RenderPassDescriptor.fromNative(ffi.Pointer<WGPURenderPassDescriptor> ptr)
      : super(ptr);

  WGPURenderPassDescriptor get _ref => _ptr.ref;

  List<RenderPassColorAttachmentDescriptorBase_TextureViewId>
      get colorAttachments {
    // ### TODO: lazy iterable
    var attachments = <RenderPassColorAttachmentDescriptorBase_TextureViewId>[];
    for (var i = 0; i < _ref.color_attachments_length; ++i) {
      attachments.add(
          RenderPassColorAttachmentDescriptorBase_TextureViewId.fromNative(
              _ref.color_attachments.elementAt(i)));
    }
    return attachments;
  }

  RenderPassDepthStencilAttachmentDescriptorBase_TextureViewId
      get depthStencilAttachent {
    return RenderPassDepthStencilAttachmentDescriptorBase_TextureViewId
        .fromNative(_ref.depth_stencil_attachment);
  }
}

/// Layout of a texture in a buffer's memory.
class TextureDataLayout extends _WGPUType<WGPUTextureDataLayout> {
  TextureDataLayout.fromNative(ffi.Pointer<WGPUTextureDataLayout> ptr)
      : super(ptr);

  WGPUTextureDataLayout get _ref => _ptr.ref;

  /// Offset into the buffer that is the start of the texture. Must be a multiple of texture block size.
  /// For non-compressed textures, this is 1.
  int get offset => _ref.offset;

  /// Bytes per "row" of the image. This represents one row of pixels in the x direction. Compressed
  /// textures include multiple rows of pixels in each "row". May be 0 for 1D texture copies.
  ///
  /// Must be a multiple of 256 for [`CommandEncoder::copy_buffer_to_texture`] and [`CommandEncoder::copy_texture_to_buffer`].
  /// [`Queue::write_texture`] does not have this requirement.
  ///
  /// Must be a multiple of the texture block size. For non-compressed textures, this is 1.
  int get bytesPerRow => _ref.bytes_per_row;

  /// Rows that make up a single "image". Each "image" is one layer in the z direction of a 3D image. May be larger
  /// than `copy_size.y`.
  ///
  /// May be 0 for 2D texture copies.
  int get rowsPerImage => _ref.rows_per_image;
}

class BufferCopyView extends _WGPUType<WGPUBufferCopyView> {
  BufferCopyView.fromNative(ffi.Pointer<WGPUBufferCopyView> ptr) : super(ptr);

  WGPUBufferCopyView get _ref => _ptr.ref;

  int get buffer => _ref.buffer;

  //external WGPUTextureDataLayout layout;
  TextureDataLayout get layout =>
      TextureDataLayout.fromNative(_ref.layout.addressOf);
}

/// Origin of a copy to/from a texture.
class Origin3D extends _WGPUType<WGPUOrigin3d> {
  Origin3D.fromNative(ffi.Pointer<WGPUOrigin3d> ptr) : super(ptr);

  WGPUOrigin3d get _ref => _ptr.ref;

  int get x => _ref.x;
  int get y => _ref.y;
  int get z => _ref.z;
}

class TextureCopyView extends _WGPUType<WGPUTextureCopyView> {
  TextureCopyView.fromNative(ffi.Pointer<WGPUTextureCopyView> ptr) : super(ptr);

  WGPUTextureCopyView get _ref => _ptr.ref;

  int get texture => _ref.texture;
  int get mipLevel => _ref.mip_level;
  Origin3D get origin => Origin3D.fromNative(_ref.origin.addressOf);
}

/// Extent of a texture related operation.
class Extent3D extends _WGPUType<WGPUExtent3d> {
  Extent3D.fromNative(ffi.Pointer<WGPUExtent3d> ptr) : super(ptr);

  WGPUExtent3d get _ref => _ptr.ref;

  int get width => _ref.width;
  int get height => _ref.height;
  int get depth => _ref.depth;
}

/// Describes a [`CommandBuffer`].
class CommandBufferDescriptor extends _WGPUType<WGPUCommandBufferDescriptor> {
  CommandBufferDescriptor.fromNative(
      ffi.Pointer<WGPUCommandBufferDescriptor> ptr)
      : super(ptr);

  WGPUCommandBufferDescriptor get _ref => _ptr.ref;

  /// Set this member to zero
  int get todo => _ref.todo;
}

class BindGroupEntry extends _WGPUType<WGPUBindGroupEntry> {
  BindGroupEntry.fromNative(ffi.Pointer<WGPUBindGroupEntry> ptr) : super(ptr);

  WGPUBindGroupEntry get _ref => _ptr.ref;

  int get binding => _ref.binding;
  int get buffer => _ref.buffer;
  int get offset => _ref.offset;
  int get size => _ref.size;
  int get sampler => _ref.sampler;
  int get texture_view => _ref.texture_view;
}

class BindGroupDescriptor extends _WGPUType<WGPUBindGroupDescriptor> {
  BindGroupDescriptor.fromNative(ffi.Pointer<WGPUBindGroupDescriptor> ptr)
      : super(ptr);

  WGPUBindGroupDescriptor get _ref => _ptr.ref;

  String get label => Utf8.fromUtf8(_ref.label.cast());
  int get layout => _ref.layout;

  List<BindGroupEntry> get entries {
    // ### TODO: lazy iterable
    var e = <BindGroupEntry>[];
    for (var i = 0; i < _ref.entries_length; ++i) {
      e.add(BindGroupEntry.fromNative(_ref.entries.elementAt(i)));
    }
    return e;
  }
}

class BindGroupLayoutEntry extends _WGPUType<WGPUBindGroupLayoutEntry> {
  BindGroupLayoutEntry.fromNative(ffi.Pointer<WGPUBindGroupLayoutEntry> ptr)
      : super(ptr);
  WGPUBindGroupLayoutEntry get _ref => _ptr.ref;

  int get binding => _ref.binding;
  int get visibility => _ref.visibility;

  BindingType get ty => BindingType.values[_ref.ty];

  bool get hasDynamicOffset => _ref.has_dynamic_offset != 0;

  int get minBufferBindingSize => _ref.min_buffer_binding_size;

  bool get multisampled => _ref.multisampled != 0;

  TextureViewDimension get viewDimension =>
      TextureViewDimension.values[_ref.view_dimension];

  TextureComponentType get textureComponentType =>
      TextureComponentType.values[_ref.texture_component_type];

  TextureFormat get storageTextureFormat =>
      TextureFormat.values[_ref.storage_texture_format];

  int get count => _ref.count;
}

class BindGroupLayoutDescriptor
    extends _WGPUType<WGPUBindGroupLayoutDescriptor> {
  BindGroupLayoutDescriptor.fromNative(
      ffi.Pointer<WGPUBindGroupLayoutDescriptor> ptr)
      : super(ptr);

  WGPUBindGroupLayoutDescriptor get _ref => _ptr.ref;

  String get label => Utf8.fromUtf8(_ref.label.cast());

  List<BindGroupLayoutEntry> get entries {
    // ### TODO: lazy iterable
    var e = <BindGroupLayoutEntry>[];
    for (var i = 0; i < _ref.entries_length; ++i) {
      e.add(BindGroupLayoutEntry.fromNative(_ref.entries.elementAt(i)));
    }
    return e;
  }
}

/// Describes a [`Buffer`].
class BufferDescriptor extends _WGPUType<WGPUBufferDescriptor> {
  BufferDescriptor.fromNative(ffi.Pointer<WGPUBufferDescriptor> ptr)
      : super(ptr);

  WGPUBufferDescriptor get _ref => _ptr.ref;

  /// Debug label of a buffer. This will show up in graphics debuggers for easy identification.
  String get label => Utf8.fromUtf8(_ref.label.cast());

  /// Size of a buffer.
  int get size => _ref.size;

  /// Usages of a buffer. If the buffer is used in any way that isn't specified here, the operation
  /// will panic.
  int get usage => _ref.usage;

  /// Allows a buffer to be mapped immediately after they are made. It does not have to be [`BufferUsage::MAP_READ`] or
  /// [`BufferUsage::MAP_WRITE`], all buffers are allowed to be mapped at creation.
  bool get mappedAtCreation => _ref.mapped_at_creation != 0;
}

/// Describes a [`CommandEncoder`].
class CommandEncoderDescriptor extends _WGPUType<WGPUCommandEncoderDescriptor> {
  CommandEncoderDescriptor.fromNative(
      ffi.Pointer<WGPUCommandEncoderDescriptor> ptr)
      : super(ptr);

  WGPUCommandEncoderDescriptor get _ref => _ptr.ref;

  /// Debug label for the command encoder. This will show up in graphics debuggers for easy identification.
  String get label => Utf8.fromUtf8(_ref.label.cast());
}

class ProgrammableStageDescriptor
    extends _WGPUType<WGPUProgrammableStageDescriptor> {
  ProgrammableStageDescriptor.fromNative(
      ffi.Pointer<WGPUProgrammableStageDescriptor> ptr)
      : super(ptr);

  WGPUProgrammableStageDescriptor get _ref => _ptr.ref;

  int get module => _ref.module;

  String get entryPoint => Utf8.fromUtf8(_ref.entry_point.cast());
}

class ComputePipelineDescriptor
    extends _WGPUType<WGPUComputePipelineDescriptor> {
  ComputePipelineDescriptor.fromNative(
      ffi.Pointer<WGPUComputePipelineDescriptor> ptr)
      : super(ptr);

  WGPUComputePipelineDescriptor get _ref => _ptr.ref;

  int get layout => _ref.layout;

  ProgrammableStageDescriptor get computeStage =>
      ProgrammableStageDescriptor.fromNative(_ref.compute_stage.addressOf);
}

class PipelineLayoutDescriptor extends _WGPUType<WGPUPipelineLayoutDescriptor> {
  PipelineLayoutDescriptor.fromNative(
      ffi.Pointer<WGPUPipelineLayoutDescriptor> ptr)
      : super(ptr);

  WGPUPipelineLayoutDescriptor get _ref => _ptr.ref;

  List<int> get bindGroupLayouts => _ref.bind_group_layouts
      .asTypedList(_ref.bind_group_layouts_length)
      .toList();
}

class RenderBundleEncoderDescriptor
    extends _WGPUType<WGPURenderBundleEncoderDescriptor> {
  RenderBundleEncoderDescriptor.fromNative(
      ffi.Pointer<WGPURenderBundleEncoderDescriptor> ptr)
      : super(ptr);

  WGPURenderBundleEncoderDescriptor get _ref => _ptr.ref;

  String get label => Utf8.fromUtf8(_ref.label.cast());

  List<TextureFormat> get colorFormats {
    // ### TODO: lazy iterable
    var formats = <TextureFormat>[];
    for (var i = 0; i < _ref.color_formats_length; ++i) {
      formats.add(TextureFormat.values[_ref.color_formats[i]]);
    }
    return formats;
  }

  List<TextureFormat> get depthStencilFormats {
    // ### TODO: lazy iterable
    var formats = <TextureFormat>[];
    for (var i = 0; i < _ref.color_formats_length; ++i) {
      formats.add(TextureFormat.values[_ref.depth_stencil_format[i]]);
    }
    return formats;
  }

  int get sampleCount => _ref.sample_count;
}

/// Describes the state of the rasterizer in a render pipeline.
class RasterizationStateDescriptor
    extends _WGPUType<WGPURasterizationStateDescriptor> {
  RasterizationStateDescriptor.fromNative(
      ffi.Pointer<WGPURasterizationStateDescriptor> ptr)
      : super(ptr);

  WGPURasterizationStateDescriptor get _ref => _ptr.ref;

  FrontFace get frontFace => FrontFace.values[_ref.front_face];
  CullMode get cullMode => CullMode.values[_ref.cull_mode];
  int get depthBias => _ref.depth_bias;
  double get depthBiasSlopeScale => _ref.depth_bias_slope_scale;
  double get depthBiasClamp => _ref.depth_bias_clamp;
}

/// Describes the blend state of a pipeline.
///
/// Alpha blending is very complicated: see the OpenGL or Vulkan spec for more information.
class BlendDescriptor extends _WGPUType<WGPUBlendDescriptor> {
  BlendDescriptor.fromNative(ffi.Pointer<WGPUBlendDescriptor> ptr) : super(ptr);

  WGPUBlendDescriptor get _ref => _ptr.ref;

  BlendFactor get srcFactor => BlendFactor.values[_ref.src_factor];
  BlendFactor get dstFactor => BlendFactor.values[_ref.dst_factor];
  BlendOperation get operation => BlendOperation.values[_ref.operation];
}

/// Describes the color state of a render pipeline.
class ColorStateDescriptor extends _WGPUType<WGPUColorStateDescriptor> {
  ColorStateDescriptor.fromNative(ffi.Pointer<WGPUColorStateDescriptor> ptr)
      : super(ptr);

  WGPUColorStateDescriptor get _ref => _ptr.ref;

  /// The [`TextureFormat`] of the image that this pipeline will render to. Must match the the format
  /// of the corresponding color attachment in [`CommandEncoder::begin_render_pass`].
  TextureFormat get format => TextureFormat.values[_ref.format];

  /// The alpha blending that is used for this pipeline.
  BlendDescriptor get alphaBlend =>
      BlendDescriptor.fromNative(_ref.alpha_blend.addressOf);

  /// The color blending that is used for this pipeline.
  BlendDescriptor get colorBlend =>
      BlendDescriptor.fromNative(_ref.color_blend.addressOf);

  /// Mask which enables/disables writes to different color/alpha channel.
  int get writeMask => _ref.write_mask;
}

/// Describes stencil state in a render pipeline.
///
/// If you are not using stencil state, set this to [`StencilStateFaceDescriptor::IGNORE`].
class StencilStateFaceDescriptor
    extends _WGPUType<WGPUStencilStateFaceDescriptor> {
  StencilStateFaceDescriptor.fromNative(
      ffi.Pointer<WGPUStencilStateFaceDescriptor> ptr)
      : super(ptr);

  WGPUStencilStateFaceDescriptor get _ref => _ptr.ref;

  /// Comparison function that determines if the fail_op or pass_op is used on the stencil buffer.
  CompareFunction get compare => CompareFunction.values[_ref.compare];

  /// Operation that is preformed when stencil test fails.
  StencilOperation get failOp => StencilOperation.values[_ref.fail_op];

  /// Operation that is performed when depth test fails but stencil test succeeds.
  StencilOperation get depthFailOp =>
      StencilOperation.values[_ref.depth_fail_op];

  /// Operation that is performed when stencil test success.
  StencilOperation get passOp => StencilOperation.values[_ref.pass_op];
}

/// Describes the depth/stencil state in a render pipeline.
class DepthStencilStateDescriptor
    extends _WGPUType<WGPUDepthStencilStateDescriptor> {
  DepthStencilStateDescriptor.fromNative(
      ffi.Pointer<WGPUDepthStencilStateDescriptor> ptr)
      : super(ptr);

  WGPUDepthStencilStateDescriptor get _ref => _ptr.ref;

  /// Format of the depth/stencil buffer, must be special depth format. Must match the the format
  /// of the depth/stencil attachment in [`CommandEncoder::begin_render_pass`].
  TextureFormat get format => TextureFormat.values[_ref.format];

  /// If disabled, depth will not be written to.
  bool get depthWriteEnabled => _ref.depth_write_enabled != 0;

  /// Comparison function used to compare depth values in the depth test.
  CompareFunction get depthCompare =>
      CompareFunction.values[_ref.depth_compare];

  /// Stencil state used for front faces.
  StencilStateFaceDescriptor get stencilFormat =>
      StencilStateFaceDescriptor.fromNative(_ref.stencil_front.addressOf);

  /// Stencil state used for back faces.
  StencilStateFaceDescriptor get stencilBack =>
      StencilStateFaceDescriptor.fromNative(_ref.stencil_back.addressOf);

  /// Stencil values are AND'd with this mask when reading and writing from the stencil buffer. Only low 8 bits are used.
  StencilOperation get stencilReadMask =>
      StencilOperation.values[_ref.stencil_read_mask];

  /// Stencil values are AND'd with this mask when writing to the stencil buffer. Only low 8 bits are used.
  StencilOperation get stencilWriteMask =>
      StencilOperation.values[_ref.stencil_write_mask];
}

/// Vertex inputs (attributes) to shaders.
///
/// Arrays of these can be made with the [`vertex_attr_array`] macro. Vertex attributes are assumed to be tightly packed.
class VertexAttributeDescriptor
    extends _WGPUType<WGPUVertexAttributeDescriptor> {
  VertexAttributeDescriptor.fromNative(
      ffi.Pointer<WGPUVertexAttributeDescriptor> ptr)
      : super(ptr);

  WGPUVertexAttributeDescriptor get _ref => _ptr.ref;

  /// Byte offset of the start of the input
  int get offset => _ref.offset;

  /// Format of the input
  VertexFormat get format => VertexFormat.values[_ref.format];

  /// Location for this input. Must match the location in the shader.
  int get shaderLocation => _ref.shader_location;
}

class VertexBufferLayoutDescriptor
    extends _WGPUType<WGPUVertexBufferLayoutDescriptor> {
  VertexBufferLayoutDescriptor.fromNative(
      ffi.Pointer<WGPUVertexBufferLayoutDescriptor> ptr)
      : super(ptr);

  WGPUVertexBufferLayoutDescriptor get _ref => _ptr.ref;

  int get arrayStride => _ref.array_stride;
  InputStepMode get stepMode => InputStepMode.values[_ref.step_mode];

  List<VertexAttributeDescriptor> get attributes {
    // ### TODO: lazy iterable
    var attrs = <VertexAttributeDescriptor>[];
    for (var i = 0; i < _ref.attributes_length; ++i) {
      attrs.add(
          VertexAttributeDescriptor.fromNative(_ref.attributes.elementAt(i)));
    }
    return attrs;
  }
}

class VertexStateDescriptor extends _WGPUType<WGPUVertexStateDescriptor> {
  VertexStateDescriptor.fromNative(ffi.Pointer<WGPUVertexStateDescriptor> ptr)
      : super(ptr);

  WGPUVertexStateDescriptor get _ref => _ptr.ref;

  IndexFormat get indexFormat => IndexFormat.values[_ref.index_format];

  List<VertexBufferLayoutDescriptor> get vertexBuffers {
    // ### TODO: lazy iterable
    var buffers = <VertexBufferLayoutDescriptor>[];
    for (var i = 0; i < _ref.vertex_buffers_length; ++i) {
      buffers.add(VertexBufferLayoutDescriptor.fromNative(
          _ref.vertex_buffers.elementAt(i)));
    }
    return buffers;
  }
}

class RenderPipelineDescriptor extends _WGPUType<WGPURenderPipelineDescriptor> {
  RenderPipelineDescriptor.fromNative(
      ffi.Pointer<WGPURenderPipelineDescriptor> ptr)
      : super(ptr);

  WGPURenderPipelineDescriptor get _ref => _ptr.ref;

  int get layout => _ref.layout;

  ProgrammableStageDescriptor get vertexStage =>
      ProgrammableStageDescriptor.fromNative(_ref.vertex_stage.addressOf);

  ProgrammableStageDescriptor get fragmentStage =>
      ProgrammableStageDescriptor.fromNative(_ref.fragment_stage);

  PrimitiveTopology get primitiveTopology =>
      PrimitiveTopology.values[_ref.primitive_topology];

  RasterizationStateDescriptor get rasterizationState =>
      RasterizationStateDescriptor.fromNative(_ref.rasterization_state);

  List<ColorStateDescriptor> get colorStates {
    // ### TODO: lazy iterable
    var states = <ColorStateDescriptor>[];
    for (var i = 0; i < _ref.color_states_length; ++i) {
      states
          .add(ColorStateDescriptor.fromNative(_ref.color_states.elementAt(i)));
    }
    return states;
  }

  DepthStencilStateDescriptor get depthStencilState =>
      DepthStencilStateDescriptor.fromNative(_ref.depth_stencil_state);

  VertexStateDescriptor get vertexState =>
      VertexStateDescriptor.fromNative(_ref.vertex_state.addressOf);

  int get sampleCount => _ref.sample_count;
  int get sampleMask => _ref.sample_mask;
  bool get alphaToCoverageEnabled => _ref.alpha_to_coverage_enabled != 0;
}

class SamplerDescriptor extends _WGPUType<WGPUSamplerDescriptor> {
  SamplerDescriptor.fromNative(ffi.Pointer<WGPUSamplerDescriptor> ptr)
      : super(ptr);

  WGPUSamplerDescriptor get _ref => _ptr.ref;

  ChainedStruct get nextInChain =>
      ChainedStruct.fromNative(_ref.next_in_chain.cast());

  String get label => Utf8.fromUtf8(_ref.label.cast());

  AddressMode get addressModeU => AddressMode.values[_ref.address_mode_u];

  AddressMode get addressModeV => AddressMode.values[_ref.address_mode_v];

  AddressMode get addressModeW => AddressMode.values[_ref.address_mode_w];

  FilterMode get magFilter => FilterMode.values[_ref.mag_filter];

  FilterMode get minFilter => FilterMode.values[_ref.min_filter];

  FilterMode get mipmapFilter => FilterMode.values[_ref.mipmap_filter];

  double get lodMinClamp => _ref.lod_min_clamp;

  double get lodMaxClamp => _ref.lod_max_clamp;

  CompareFunction get compare => CompareFunction.values[_ref.compare];
}

class ShaderSource extends _WGPUType<WGPUShaderSource> {
  ShaderSource.fromNative(ffi.Pointer<WGPUShaderSource> ptr) : super(ptr);

  WGPUShaderSource get _ref => _ptr.ref;

  UnmodifiableUint32ListView get bytes {
    return UnmodifiableUint32ListView(_ref.bytes.asTypedList(_ref.length));
  }
}

/// Describes a [`SwapChain`].
class SwapChainDescriptor extends _WGPUType<WGPUSwapChainDescriptor> {
  SwapChainDescriptor.fromNative(ffi.Pointer<WGPUSwapChainDescriptor> ptr)
      : super(ptr);

  WGPUSwapChainDescriptor get _ref => _ptr.ref;

  /// The usage of the swap chain. The only supported usage is OUTPUT_ATTACHMENT
  int get usage => _ref.usage;

  /// The texture format of the swap chain. The only formats that are guaranteed are
  /// `Bgra8Unorm` and `Bgra8UnormSrgb`
  TextureFormat get format => TextureFormat.values[_ref.format];

  /// Width of the swap chain. Must be the same size as the surface.
  int get width => _ref.width;

  /// Height of the swap chain. Must be the same size as the surface.
  int get height => _ref.height;

  /// Presentation mode of the swap chain. FIFO is the only guaranteed to be supported, though
  /// other formats will automatically fall back to FIFO.
  PresentMode get presentMode => PresentMode.values[_ref.present_mode];
}

/// Describes a [`Texture`].
class TextureDescriptor extends _WGPUType<WGPUTextureDescriptor> {
  TextureDescriptor.fromNative(ffi.Pointer<WGPUTextureDescriptor> ptr)
      : super(ptr);
  WGPUTextureDescriptor get _ref => _ptr.ref;

  /// Debug label of the texture. This will show up in graphics debuggers for easy identification.
  String get label => Utf8.fromUtf8(_ref.label.cast());

  /// Size of the texture. For a regular 1D/2D texture, the unused sizes will be 1. For 2DArray textures, Z is the
  /// number of 2D textures in that array.
  Extent3D get size => Extent3D.fromNative(_ref.size.addressOf);

  /// Mip count of texture. For a texture with no extra mips, this must be 1.
  int get mipLevelCount => _ref.mip_level_count;

  /// Sample count of texture. If this is not 1, texture must have [`BindingType::SampledTexture::multisampled`] set to true.
  int get sampleCount => _ref.sample_count;

  /// Dimensions of the texture.
  TextureDimension get dimension => TextureDimension.values[_ref.dimension];

  /// Format of the texture.
  TextureFormat get format => TextureFormat.values[_ref.format];

  /// Allowed usages of the texture. If used in other ways, the operation will panic.
  int get usage => _ref.usage;
}

/// Describes a [`RenderBundle`].
class RenderBundleDescriptor_Label
    extends _WGPUType<WGPURenderBundleDescriptor_Label> {
  RenderBundleDescriptor_Label.fromNative(
      ffi.Pointer<WGPURenderBundleDescriptor_Label> ptr)
      : super(ptr);

  WGPURenderBundleDescriptor_Label get _ref => _ptr.ref;

  /// Debug label of the render bundle encoder. This will show up in graphics debuggers for easy identification.
  String get label => Utf8.fromUtf8(_ref.label.cast());
}

class RequestAdapterOptions extends _WGPUType<WGPURequestAdapterOptions> {
  RequestAdapterOptions.fromNative(ffi.Pointer<WGPURequestAdapterOptions> ptr)
      : super(ptr);

  WGPURequestAdapterOptions get _ref => _ptr.ref;

  PowerPreference get powerPreference =>
      PowerPreference.values[_ref.power_preference];

  int get compatibleSurface => _ref.compatible_surface;
}

class SwapChainOutput extends _WGPUType<WGPUSwapChainOutput> {
  SwapChainOutput.fromNative(ffi.Pointer<WGPUSwapChainOutput> ptr) : super(ptr);

  WGPUSwapChainOutput get _ref => _ptr.ref;

  SwapChainStatus get status => SwapChainStatus.values[_ref.status];

  int get viewId => _ref.view_id;
}

/// Describes a [`TextureView`].
class TextureViewDescriptor extends _WGPUType<WGPUTextureViewDescriptor> {
  TextureViewDescriptor.fromNative(ffi.Pointer<WGPUTextureViewDescriptor> ptr)
      : super(ptr);
  WGPUTextureViewDescriptor get _ref => _ptr.ref;

  /// Debug label of the texture view. This will show up in graphics debuggers for easy identification.
  String get label => Utf8.fromUtf8(_ref.label.cast());

  /// Format of the texture view. At this time, it must be the same as the underlying format of the texture.
  TextureFormat get format => TextureFormat.values[_ref.format];

  /// The dimension of the texture view. For 1D textures, this must be `1D`. For 2D textures it must be one of
  /// `D2`, `D2Array`, `Cube`, and `CubeArray`. For 3D textures it must be `3D`
  TextureDimension get dimension => TextureDimension.values[_ref.dimension];

  /// Aspect of the texture. Color textures must be [`TextureAspect::All`].
  TextureAspect get aspect => TextureAspect.values[_ref.aspect];

  /// Base mip level.
  int get baseMipLevel => _ref.base_mip_level;

  /// Mip level count. Must be at least one. base_mip_level + level_count must be less or equal to underlying texture mip count.
  int get levelCount => _ref.level_count;

  /// Base array layer.
  int get baseArrayLayer => _ref.base_array_layer;

  /// Layer count. Must be at least one. base_array_layer + array_layer_count must be less or equal to the underlying array count.
  int get arrayLayerCount => _ref.array_layer_count;
}

class AnisotropicSamplerDescriptorExt
    extends _WGPUType<WGPUAnisotropicSamplerDescriptorExt> {
  AnisotropicSamplerDescriptorExt.fromNative(
      ffi.Pointer<WGPUAnisotropicSamplerDescriptorExt> ptr)
      : super(ptr);

  WGPUAnisotropicSamplerDescriptorExt get _ref => _ptr.ref;

  ChainedStruct get nextInChain =>
      ChainedStruct.fromNative(_ref.next_in_chain.cast());

  SType get sType => SType.values[_ref.s_type];

  int get anisotropicClamp => _ref.anisotropic_clamp;
}