yaw_pitch_roll = [30,20,-10]*pi/180;
BN = Euler3212C(yaw_pitch_roll);

S_N = [1 0 0]'; %vector in coordinate
m_N = [0 0 1]'; %vector in coordinate

s_B_true = BN*S_N;
m_B_true = BN*m_N;
S_B = [0.8190 -0.5282 0.2242]';
s_BS_B/norm(s_B);

m_B = [-0.3138 -0.1548 0.9362]'; m_Bm_B/norm(m_B);

t1_B = S_B;
t2_B = cross(s_B,m_B)/norm(cross(s_B,m_B));
t3_B = cross(t1_B,t2_B);

BT = [t1_B t2_B t3_B];

t1_N = S_N;
t2_N = cross(s_N,m_N)/norm(cross(s_N,m_N));
t3_N = cross(t1_N, t2_N);

NT = [t1_N t2_N t3_N];

barBN = BT*NT';

yaw atan2(barBN (2,1), barBN (1,1));
pitch = atan2(-barBN (3,1), sqrt(barBN (3,2)^2 + barBN(3,3)^2));
roll = atan2(barBN (3,2), barBN(3,3));