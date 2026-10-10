#version 300 es
precision mediump float;

in vec2 v_texcoord;
uniform sampler2D tex;
out vec4 fragColor;

const float SATURATION = 1.3;

void main() {
    vec4 color = texture(tex, v_texcoord);
    float luma = dot(color.rgb, vec3(0.2126, 0.7152, 0.0722));
    color.rgb = clamp(mix(vec3(luma), color.rgb, SATURATION), 0.0, 1.0);
    fragColor = color;
}
