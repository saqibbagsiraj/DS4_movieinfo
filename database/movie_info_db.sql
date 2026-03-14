--users
CREATE TABLE users (
    id BIGSERIAL PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

--movies
CREATE TABLE movies (
    id BIGSERIAL PRIMARY KEY,
    imdb_id VARCHAR(20) UNIQUE,
    title VARCHAR(255) NOT NULL,
    year INT,
    genre VARCHAR(255),
    rating DOUBLE PRECISION,
    plot TEXT,
    poster_url VARCHAR(500),
    search_count INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

--favorites
CREATE TABLE favorites (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT NOT NULL,
    movie_id BIGINT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_user
        FOREIGN KEY(user_id)
        REFERENCES users(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_movie
        FOREIGN KEY(movie_id)
        REFERENCES movies(id)
        ON DELETE CASCADE
);

--search
CREATE TABLE search_history (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT,
    search_query VARCHAR(255),
    searched_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_user_search
        FOREIGN KEY(user_id)
        REFERENCES users(id)
        ON DELETE CASCADE
);
