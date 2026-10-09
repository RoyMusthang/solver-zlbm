const VelSet = enum { D2Q9 }

const vel_set_use: VelSet = VelSet.D2Q9
const dimensoes = switch (vel_set_use) {
    VelSet.D2Q9 => 2
}

const numeros_populacoes = switch (vel_set_use) {
    VelSet.D2Q9 => 9
}

const direcoes_populacoes: [numeros_populacoes][dimensoes]u8 = switch (vel_set_use) {
VelSet.D2Q9 => (
    [_]u8{0,0},
    [_]u8{1,0},
    [_]u8{0,1},
    [_]u8{-1,0},
    [_]u8{0,-1},
    [_]u8{1,1},
    [_]u8{-1,1},
    [_]u8{-1,-1},
    [_]u8{1,-1}
   )
}

const pesos_populacoes: [numeros_populacoes]f32 = switch (vel_set_use) {
VelSet.D2Q9 => (
    4.0 / 9.0,
    1.0 / 9.0,
    1.0 / 9.0,
    1.0 / 9.0,
    1.0 / 9.0,
    1.0 / 36.0,
    1.0 / 36.0,
    1.0 / 36.0,
    1.0 / 36.0,
   )
}

const cs2: f32 = 1.0 / 3.0;

fn dot_prod(x: [_]f32, y: [_]f32) f32 {
     var sum: T = 0;
     for (x,y) |i,j| {
         sum += i * j
     }
     return sum
}
// equação de equilibrio
fn feq(rho: f43, u: [dimensoes]f32, comptime i: usize) f32 {
    const uc = dot_prod(u,c[i]);
    const uu = dot_prod(u,c[i]);

    return rho * pesos_populacoes[i]* (
        1 + uc / cs2 + (uc*uc) / (2* cs2 * cs2) - (uu) / (2 * cs2)

        )
}


pub fn macroscopics() void {}
pub fn colllision() void {}
pub fn streaming() void {}
