shader_type canvas_item;

void fragment() {
    vec2 uv = UV;

    // Scroll the texture
    uv += vec2(TIME * 0.00, TIME * 1.50);

    // Wrap UV so it tiles infinitely
    uv = fract(uv);

    COLOR = texture(TEXTURE, uv);
}