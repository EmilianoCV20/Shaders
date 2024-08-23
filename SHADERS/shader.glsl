precision mediump float;

uniform vec2 u_resolution;
uniform float u_time;

void main() {
    vec2 uv = (gl_FragCoord.xy * 2.0 - u_resolution.xy) / u_resolution.y;

    vec3 color = vec3(0.0, 0.0, 0.0);

    float circle = length(uv) - 0.5;
    circle = abs(circle);
    circle = 0.001/circle;
    circle = smoothstep(0.0, 0.01, circle);

    color = mix(vec3(1.0, 1.0, 1.0), color, 1.0 - circle);

    // SWIZZILING
    gl_FragColor = vec4(color , 1.0);
}