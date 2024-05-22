SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: fuzzystrmatch; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;


--
-- Name: EXTENSION fuzzystrmatch; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';


--
-- Name: pg_trgm; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA public;


--
-- Name: EXTENSION pg_trgm; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pg_trgm IS 'text similarity measurement and index searching based on trigrams';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: administrators; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.administrators (
    id bigint NOT NULL,
    email character varying,
    password_digest character varying,
    first_name character varying,
    last_name character varying,
    remember_token character varying,
    remember_token_expires_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: administrators_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.administrators_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: administrators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.administrators_id_seq OWNED BY public.administrators.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: credits; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.credits (
    id bigint NOT NULL,
    media_type character varying,
    media_id bigint,
    person_id bigint,
    role character varying,
    "order" integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    type character varying
);


--
-- Name: credits_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.credits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: credits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.credits_id_seq OWNED BY public.credits.id;


--
-- Name: genres; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.genres (
    id bigint NOT NULL,
    type character varying,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: genres_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.genres_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: genres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.genres_id_seq OWNED BY public.genres.id;


--
-- Name: genres_movies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.genres_movies (
    genre_id bigint,
    movie_id bigint
);


--
-- Name: genres_tv_shows; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.genres_tv_shows (
    genre_id bigint,
    tv_show_id bigint
);


--
-- Name: images; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.images (
    id bigint NOT NULL,
    media_type character varying,
    media_id bigint,
    image_type character varying,
    file_path character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: images_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.images_id_seq OWNED BY public.images.id;


--
-- Name: movies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.movies (
    id bigint NOT NULL,
    tmdb_id integer,
    imdb_id character varying,
    title character varying,
    tagline character varying,
    overview character varying,
    homepage character varying,
    status character varying,
    runtime integer,
    budget bigint,
    revenue bigint,
    release_date date,
    poster_path character varying,
    backdrop_path character varying,
    video boolean,
    vote_average double precision DEFAULT 0.0,
    vote_count integer DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    tsv tsvector
);


--
-- Name: movies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.movies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: movies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.movies_id_seq OWNED BY public.movies.id;


--
-- Name: people; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.people (
    id bigint NOT NULL,
    tmdb_id integer,
    name character varying,
    gender integer DEFAULT 0,
    profile_path character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    tsv tsvector
);


--
-- Name: people_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.people_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: people_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.people_id_seq OWNED BY public.people.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: tv_show_seasons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tv_show_seasons (
    id bigint NOT NULL,
    tv_show_id bigint,
    tmdb_id integer,
    number integer,
    name character varying,
    overview character varying,
    air_date date,
    episode_count integer,
    poster_path character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: tv_show_seasons_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tv_show_seasons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tv_show_seasons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tv_show_seasons_id_seq OWNED BY public.tv_show_seasons.id;


--
-- Name: tv_shows; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tv_shows (
    id bigint NOT NULL,
    tmdb_id integer,
    name character varying,
    overview character varying,
    homepage character varying,
    status character varying,
    first_air_date date,
    last_air_date date,
    poster_path character varying,
    backdrop_path character varying,
    vote_average double precision DEFAULT 0.0,
    vote_count integer DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    tsv tsvector
);


--
-- Name: tv_shows_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tv_shows_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tv_shows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tv_shows_id_seq OWNED BY public.tv_shows.id;


--
-- Name: videos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.videos (
    id bigint NOT NULL,
    media_type character varying,
    media_id bigint,
    name character varying,
    site character varying,
    key character varying,
    video_type character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: videos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.videos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: videos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.videos_id_seq OWNED BY public.videos.id;


--
-- Name: administrators id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.administrators ALTER COLUMN id SET DEFAULT nextval('public.administrators_id_seq'::regclass);


--
-- Name: credits id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.credits ALTER COLUMN id SET DEFAULT nextval('public.credits_id_seq'::regclass);


--
-- Name: genres id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genres ALTER COLUMN id SET DEFAULT nextval('public.genres_id_seq'::regclass);


--
-- Name: images id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.images ALTER COLUMN id SET DEFAULT nextval('public.images_id_seq'::regclass);


--
-- Name: movies id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movies ALTER COLUMN id SET DEFAULT nextval('public.movies_id_seq'::regclass);


--
-- Name: people id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.people ALTER COLUMN id SET DEFAULT nextval('public.people_id_seq'::regclass);


--
-- Name: tv_show_seasons id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tv_show_seasons ALTER COLUMN id SET DEFAULT nextval('public.tv_show_seasons_id_seq'::regclass);


--
-- Name: tv_shows id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tv_shows ALTER COLUMN id SET DEFAULT nextval('public.tv_shows_id_seq'::regclass);


--
-- Name: videos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.videos ALTER COLUMN id SET DEFAULT nextval('public.videos_id_seq'::regclass);


--
-- Name: administrators administrators_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.administrators
    ADD CONSTRAINT administrators_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: credits credits_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.credits
    ADD CONSTRAINT credits_pkey PRIMARY KEY (id);


--
-- Name: genres genres_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (id);


--
-- Name: images images_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT images_pkey PRIMARY KEY (id);


--
-- Name: movies movies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_pkey PRIMARY KEY (id);


--
-- Name: people people_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.people
    ADD CONSTRAINT people_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: tv_show_seasons tv_show_seasons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tv_show_seasons
    ADD CONSTRAINT tv_show_seasons_pkey PRIMARY KEY (id);


--
-- Name: tv_shows tv_shows_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tv_shows
    ADD CONSTRAINT tv_shows_pkey PRIMARY KEY (id);


--
-- Name: videos videos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.videos
    ADD CONSTRAINT videos_pkey PRIMARY KEY (id);


--
-- Name: index_credits_on_media_type_and_media_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_credits_on_media_type_and_media_id ON public.credits USING btree (media_type, media_id);


--
-- Name: index_credits_on_person_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_credits_on_person_id ON public.credits USING btree (person_id);


--
-- Name: index_genres_movies_on_genre_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_genres_movies_on_genre_id ON public.genres_movies USING btree (genre_id);


--
-- Name: index_genres_movies_on_movie_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_genres_movies_on_movie_id ON public.genres_movies USING btree (movie_id);


--
-- Name: index_genres_on_type_and_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_genres_on_type_and_name ON public.genres USING btree (type, name);


--
-- Name: index_genres_tv_shows_on_genre_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_genres_tv_shows_on_genre_id ON public.genres_tv_shows USING btree (genre_id);


--
-- Name: index_genres_tv_shows_on_tv_show_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_genres_tv_shows_on_tv_show_id ON public.genres_tv_shows USING btree (tv_show_id);


--
-- Name: index_images_on_media_type_and_media_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_images_on_media_type_and_media_id ON public.images USING btree (media_type, media_id);


--
-- Name: index_movies_on_release_date; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_movies_on_release_date ON public.movies USING btree (release_date);


--
-- Name: index_movies_on_title; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_movies_on_title ON public.movies USING btree (title);


--
-- Name: index_movies_on_tsv; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_movies_on_tsv ON public.movies USING gin (tsv);


--
-- Name: index_movies_on_vote_average; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_movies_on_vote_average ON public.movies USING btree (vote_average);


--
-- Name: index_movies_search; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_movies_search ON public.movies USING gist ((((to_tsvector('simple'::regconfig, COALESCE((title)::text, ''::text)) || to_tsvector('simple'::regconfig, COALESCE((tagline)::text, ''::text))) || to_tsvector('simple'::regconfig, COALESCE((overview)::text, ''::text)))));


--
-- Name: index_people_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_people_on_name ON public.people USING btree (name);


--
-- Name: index_people_on_tsv; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_people_on_tsv ON public.people USING gin (tsv);


--
-- Name: index_tv_show_seasons_on_tv_show_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tv_show_seasons_on_tv_show_id ON public.tv_show_seasons USING btree (tv_show_id);


--
-- Name: index_tv_shows_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tv_shows_on_name ON public.tv_shows USING btree (name);


--
-- Name: index_tv_shows_on_tsv; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tv_shows_on_tsv ON public.tv_shows USING gin (tsv);


--
-- Name: index_tv_shows_on_vote_average; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tv_shows_on_vote_average ON public.tv_shows USING btree (vote_average);


--
-- Name: index_videos_on_media_type_and_media_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_videos_on_media_type_and_media_id ON public.videos USING btree (media_type, media_id);


--
-- Name: movies tsvectorupdate; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER tsvectorupdate BEFORE INSERT OR UPDATE ON public.movies FOR EACH ROW EXECUTE FUNCTION tsvector_update_trigger('tsv', 'pg_catalog.simple', 'title', 'tagline', 'overview');


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20190215043801'),
('20190215233809'),
('20190216013706'),
('20190216033823'),
('20190217101851'),
('20190217232600'),
('20190218012356'),
('20190218021740'),
('20190218040145'),
('20190218042745'),
('20190222021908'),
('20190222030705'),
('20190222030923'),
('20190222031028'),
('20210514112735'),
('20210514114729'),
('20210514120638');


