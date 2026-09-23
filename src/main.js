import * as THREE from 'three'
import './style.css'

const scene = new THREE.Scene()
scene.background = new THREE.Color(0x05070d)

const camera = new THREE.PerspectiveCamera(
  60,
  window.innerWidth / window.innerHeight,
  0.1,
  1000
)

camera.position.set(0, 6, 9)
camera.lookAt(0, 0, -10)

const renderer = new THREE.WebGLRenderer({ antialias: true })
renderer.setSize(window.innerWidth, window.innerHeight)
renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2))
document.body.appendChild(renderer.domElement)

// 조명
scene.add(new THREE.AmbientLight(0xffffff, 0.6))

const light = new THREE.DirectionalLight(0xffffff, 1.5)
light.position.set(0, 10, 5)
scene.add(light)

// 레인
const laneWidth = 2
const laneLength = 40

for (let i = 0; i < 4; i++) {
  const geometry = new THREE.BoxGeometry(
    laneWidth - 0.08,
    0.08,
    laneLength
  )

  const material = new THREE.MeshStandardMaterial({
    color: 0x151b2d,
    roughness: 0.7,
    metalness: 0.3
  })

  const lane = new THREE.Mesh(geometry, material)

  lane.position.set(
    (i - 1.5) * laneWidth,
    0,
    -10
  )

  scene.add(lane)
}

// 레인 경계
for (let i = 0; i <= 4; i++) {
  const geometry = new THREE.BoxGeometry(
    0.05,
    0.12,
    laneLength
  )

  const material = new THREE.MeshBasicMaterial({
    color: 0x4b5b7a
  })

  const line = new THREE.Mesh(geometry, material)

  line.position.set(
    (i - 2) * laneWidth,
    0.08,
    -10
  )

  scene.add(line)
}

// 판정선
const judgementGeometry = new THREE.BoxGeometry(8, 0.12, 0.3)

const judgementMaterial = new THREE.MeshStandardMaterial({
  color: 0xffffff,
  emissive: 0x4466ff,
  emissiveIntensity: 2
})

const judgementLine = new THREE.Mesh(
  judgementGeometry,
  judgementMaterial
)

judgementLine.position.set(0, 0.2, 5)

scene.add(judgementLine)

// 테스트 노트
const noteGeometry = new THREE.BoxGeometry(1.5, 0.35, 0.7)

const noteMaterial = new THREE.MeshStandardMaterial({
  color: 0x44aaff,
  emissive: 0x1155ff,
  emissiveIntensity: 1.5
})

const note = new THREE.Mesh(
  noteGeometry,
  noteMaterial
)

note.position.set(0, 0.35, -25)

scene.add(note)

// 애니메이션
function animate() {
  requestAnimationFrame(animate)

  note.position.z += 0.12

  if (note.position.z > 6) {
    note.position.z = -25
  }

  renderer.render(scene, camera)
}

animate()

// 화면 크기 대응
window.addEventListener('resize', () => {
  camera.aspect = window.innerWidth / window.innerHeight
  camera.updateProjectionMatrix()

  renderer.setSize(window.innerWidth, window.innerHeight)
})
