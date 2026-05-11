# XIAOHONGSHU NIGHT — Invitation Card

샤오홍슈 나이트 OPENING PARTY 초대장 (AB Mix 버전 + 오시는 길 + RSVP)

- 행사일 : 2026.05.29 (FRI) 18:00 — 22:00
- 장소 : WOOMUL · 서울특별시 마포구 성지길 40, 1층
- 호스트 : OFF-AIR × Xiaohongshu Global MCN

---

## 📁 폴더 구조

```
xhs-night/
├── index.html              ← 초대장 메인 (단일 HTML, 인라인 CSS·JS·지도)
├── env.js                  ← 환경변수 슬롯 (Vercel 빌드 시 자동 교체)
├── build.sh                ← Vercel 빌드 스크립트
├── vercel.json             ← Vercel 설정
├── package.json
├── .gitignore
├── supabase-schema.sql     ← Supabase 테이블 생성 SQL
└── README.md
```

---

## 🚀 배포 전체 흐름

```
[1] Supabase 테이블 만들기  →  [2] GitHub 업로드  →  [3] Vercel Import & 환경변수 등록  →  [4] Deploy
```

### 1단계 — Supabase 테이블 생성

1. Supabase Dashboard 접속 → 프로젝트 선택
2. 좌측 메뉴 **SQL Editor** 클릭 → **New query**
3. `supabase-schema.sql` 파일 내용 전체 복사 → 붙여넣기
4. **RUN** 클릭 → "Success" 메시지 확인
5. 좌측 **Table Editor** → `rsvp` 테이블 보임

### 2단계 — GitHub 업로드

1. https://github.com/new → Repository name: `xhs-night`
2. **Create repository** → 「**uploading an existing file**」 클릭
3. 이 폴더 안의 **모든 파일**을 드래그 & 드롭
4. **Commit changes**

### 3단계 — Vercel Import & 환경변수 등록

**A. Import**
1. https://vercel.com → **Add New… → Project**
2. GitHub의 `xhs-night` 선택 → **Import**

**B. 환경변수 등록** (Deploy 누르기 전!)
배포 설정 화면에서 **Environment Variables** 섹션 펼치기:

| Name | Value |
|---|---|
| `SUPABASE_URL` | (Supabase Dashboard → Settings → API → Project URL) |
| `SUPABASE_ANON_KEY` | (같은 화면 → Project API keys → `anon public`) |

각 항목 **Add** 클릭 → 「**Deploy**」 클릭

**C. 30초 대기** → 자동 배포 완료

### 4단계 — 동작 확인

- 배포 도메인 접속 → TO JOIN 버튼 클릭 → 폼 작성 → 「참 석 등 록」
- Supabase Dashboard → Table Editor → `rsvp` 테이블에 데이터 들어오는지 확인

---

## 🔧 환경변수 수정 / 재배포

환경변수만 바꾸면 자동 재배포 안됨. 명시적 재배포 필요:

1. Vercel Dashboard → 프로젝트 → **Settings → Environment Variables** 에서 수정
2. **Deployments** 탭 → 최신 deployment 우측 **⋯ → Redeploy**

---

## 🛠 로컬 테스트 (선택)

`env.js`가 비어있는 상태라서 로컬에서 더블클릭으로 열어도 폼은 **mock 모드**로 동작:
- 신청 누르면 `console.log()`로 데이터 출력
- "신 청 완 료" 화면 정상 표시
- Supabase 저장은 안 됨 (정상 동작)

---

## ✏️ 자주 수정할 영역

`index.html` 안에서 검색:

| 수정할 것 | 검색어 |
|---|---|
| 행사 주소 | `성지길 40` |
| 합정역 안내 | `합정역 7번` |
| 주차 안내 | `인근 공영` |
| 행사일 / 시간 | `2026.05.29` |
| RSVP 마감일 | `2026.05.22` |
| 아젠다 시간표 | `<div class="ag-row">` |
| 메인 카피 | `<div class="p-invite">` |

---

## 🎨 디자인 자산 (PNG / PSD) 적용

코드 상단 주석 「🎨 디자인 자산 적용 가이드」 참고.
주요 슬롯:
- Poster 배경 (`.poster` background)
- 지도 이미지 (`.map-slot img src` — 현재 인라인 base64)
- RSVP 섹션 배경 (`.rsvp` background)

---

## 📞 문의

OFF-AIR · Xiaohongshu Night 운영팀
