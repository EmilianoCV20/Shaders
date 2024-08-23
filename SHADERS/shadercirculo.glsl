precision mediump float;

uniform vec2 u_resolution;
uniform float u_time;

vec3 pallete(float t) {
    //vec3 a = vec3(0.5, 0.5, 0.5);
    //vec3 b = vec3(0.5, 0.5, 0.5);
    //vec3 c = vec3(1.0, 1.0, 1.0);
   // vec3 d= vec3(0.263, 0.416, 0.557);
    
    vec3 a = vec3(1.0, 0.5, 0.5);
    vec3 b = vec3(0.5, 0.5, 0.5);
    vec3 c = vec3(1.0, 0.5, 1.0);
    vec3 d= vec3(0.263, 0.416, 0.557);

    return a+b*cos(6.28318*(c*t+d));
}

void main() {
    vec2 uv = (gl_FragCoord.xy * 2.0 - u_resolution.xy) / u_resolution.y;
    vec2 uv0 = uv;
    vec3 finalcolor = vec3(0.0, 0.0, 0.0);

    for (float i = 0.0; i < 6.0; i++) {
        uv = fract(uv *1.5) - 0.5;

        float circle = length(uv) * exp(-length(uv0));

        vec3 color = pallete(length(uv0) + i*0.7 + u_time*0.2);

        //circle = sin(circle*20.0 + u_time)/4.0;
        circle = sin(circle * 20.0 + u_time) / 5.0;
        circle = abs(circle);
        circle = pow(0.01/circle, 3.0);
        circle = smoothstep(0.0, 0.1, circle);

        //color = mix(vec3(1.0, 1.0, 1.0), color, 1.0 - circle);
        //color *= circle;
        finalcolor += color * circle;
    }

    // SWIZZILING
    gl_FragColor = vec4(finalcolor , 1.0);
}