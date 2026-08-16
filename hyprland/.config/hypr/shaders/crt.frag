#version 300 es
// ──────────────────────────────────────────────────────────────────────
//  CRT — curvatura de tubo
//  Distorção de barril + vinheta nos cantos. Sem scanline: com fonte de
//  pixel em 13px, scanline destrói a legibilidade.
//
//  Ligar/desligar: crt-toggle   (ou Mod+F2)
//  CURVATURE: quanto MENOR, mais torto. 12 = sutil, 6 = televisão velha.
//
//  A diretiva #version acima é obrigatória — o Hyprland compila o vertex
//  shader em GLSL ES 3.00 e recusa o link se o fragment não bater.
// ──────────────────────────────────────────────────────────────────────

precision mediump float;

in vec2 v_texcoord;
uniform sampler2D tex;
out vec4 fragColor;

const float CURVATURE = 8.0;
const float VIGNETTE  = 0.20;

vec2 curve(vec2 uv) {
    uv = uv * 2.0 - 1.0;
    vec2 offset = abs(uv.yx) / CURVATURE;
    uv = uv + uv * offset * offset;
    return uv * 0.5 + 0.5;
}

void main() {
    vec2 uv = curve(v_texcoord);

    // Fora do tubo é moldura, não imagem esticada.
    if (uv.x < 0.0 || uv.x > 1.0 || uv.y < 0.0 || uv.y > 1.0) {
        fragColor = vec4(0.0, 0.0, 0.0, 1.0);
        return;
    }

    vec4 color = texture(tex, uv);

    // Vinheta — o tubo escurece nas quinas.
    vec2 v = uv * (1.0 - uv.yx);
    float vig = clamp(pow(v.x * v.y * 40.0, VIGNETTE), 0.0, 1.0);
    color.rgb *= vig;

    fragColor = color;
}
