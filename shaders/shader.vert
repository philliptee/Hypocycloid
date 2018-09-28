#version 450
#extension GL_ARB_separate_shader_objects : enable

out gl_PerVertex {
    vec4 gl_Position;
};

layout(binding = 0) uniform UniformBufferObject {
    mat4 model;
    mat4 view;
    mat4 proj;
    float r;
    float R;
    float n;
    float total;
    float dist;
} ubo;

vec2 positions[3] = vec2[](
    vec2(0.0, -0.5),
    vec2(0.5, 0.5),
    vec2(-0.5, 0.5)
);

vec3 colors[3] = vec3[](
    vec3(1.0, 0.0, 0.0),
    vec3(0.0, 1.0, 0.0),
    vec3(0.0, 0.0, 1.0)
);

void main() {
    float M_PI  = 3.1415926535897932384626433832795;
    float theta = (gl_VertexIndex/ubo.total)*2*M_PI*ubo.n;
    float x = (ubo.R-ubo.r)*cos(theta) + ubo.r*cos(((ubo.R-ubo.r)/ubo.r) * theta);
    float y = (ubo.R-ubo.r)*sin(theta) - ubo.r*sin(((ubo.R-ubo.r)/ubo.r) * theta);
    gl_Position = ubo.proj * ubo.view * ubo.model * vec4(x,y, 0.0, 1.0);
}