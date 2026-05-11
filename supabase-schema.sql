-- ═══════════════════════════════════════════════════════════════
-- Xiaohongshu Night · RSVP 테이블 생성 SQL
-- ───────────────────────────────────────────────────────────────
-- 사용 방법:
--   1) Supabase Dashboard → SQL Editor 접속
--   2) 아래 SQL 전체를 복사·붙여넣기
--   3) RUN 클릭
-- ═══════════════════════════════════════════════════════════════

-- 1. 테이블 생성
create table if not exists public.rsvp (
  id uuid primary key default gen_random_uuid(),
  created_at timestamptz default now(),

  -- 참석자 정보
  name text not null,
  country text not null check (country in ('KR', 'CN')),
  gender text not null check (gender in ('M', 'F')),
  sns text,
  phone text not null,
  email text not null,

  -- 동반자 여부
  plus_one text not null check (plus_one in ('solo', 'plus1')),

  -- 동반자 정보 (plus_one = 'plus1' 일 때만 채워짐)
  companion_name text,
  companion_sns text,
  companion_gender text check (companion_gender in ('M', 'F') or companion_gender is null),
  companion_phone text
);

-- 2. 인덱스 (조회 속도 개선)
create index if not exists rsvp_created_at_idx on public.rsvp (created_at desc);
create index if not exists rsvp_country_idx on public.rsvp (country);

-- 3. RLS (Row Level Security) — 익명 사용자가 INSERT만 가능
alter table public.rsvp enable row level security;

-- 정책: 누구나 신청(insert)할 수 있음
create policy "Anyone can submit RSVP"
  on public.rsvp
  for insert
  to anon, authenticated
  with check (true);

-- 정책: 어드민만 조회 가능 (service_role key로만 접근)
-- → 익명 사용자가 다른 사람 신청 내역 못 봄
create policy "Only authenticated users can read"
  on public.rsvp
  for select
  to authenticated
  using (true);

-- ═══════════════════════════════════════════════════════════════
-- 데이터 확인 (선택 — RUN 따로 실행)
-- ═══════════════════════════════════════════════════════════════
-- select * from public.rsvp order by created_at desc;
-- select count(*), country, plus_one from public.rsvp group by country, plus_one;
