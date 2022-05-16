//
//  Shader.metal
//  MVCNodeEditor
//
//  Created by クワシマ・ユウキ on 2022/05/16.
//

#include <metal_stdlib>
using namespace metal;

kernel void test(   texture2d<float, access::write> tex [[texture(0)]],
                    texture2d<float, access::read> subRead1 [[texture(1)]],
                    texture2d<float, access::write> subWrite1 [[texture(2)]],
                    device float* args [[buffer(0)]],
                    ushort2 gid [[thread_position_in_grid]]) {
    float2 center = float2(tex.get_width() / 2, tex.get_height() / 2);
    float dist = pow(pow(center.x - gid.x, 2) + pow(center.y - gid.y, 2), 0.5);
    float size = 30 * abs(sin(args[0] * 1));
    tex.write(size / dist, gid);
}


