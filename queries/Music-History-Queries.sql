SELECT * 
FROM Genre;

INSERT 
INTO Artist (ArtistName, YearEstablished) VALUES ('S Club 7', '1995');

INSERT 
INTO Album(Title, ReleaseDate, AlbumLength, [Label], ArtistId, GenreId) VALUES ('S Club Its a thing', '1995', '15000', 'Def Jam', '28', '7');

INSERT 
INTO Song(Title, SongLength, ReleaseDate, GenreId, AlbumId, ArtistId) VALUES ('S Club Party', '120', '1995', '7', '23', '25');

SELECT * 
FROM Artist;
SELECT * 
FROM Album;
SELECT * 
FROM Song;

SELECT a.Title, s.Title, ar.ArtistName
FROM Song s
LEFT JOIN Album a
ON s.AlbumId = a.Id
LEFT JOIN Artist ar
ON s.ArtistId = ar.Id
LEFT JOIN Genre g
ON s.GenreId = g.Id;

SELECT COUNT(AlbumId)
AS 'Song Count', a.Title
FROM Song s
LEFT JOIN Album a
ON s.AlbumId = a.Id
GROUP BY AlbumId, a.Title
ORDER BY COUNT(AlbumId) desc;


SELECT COUNT(ArtistId)
AS 'Song Count', ar.ArtistName
FROM Song s
LEFT JOIN Artist ar
ON s.ArtistId = ar.Id
GROUP BY ArtistId, ar.ArtistName
ORDER BY COUNT(ArtistId) desc;


SELECT COUNT(GenreId)
AS 'Song Count', g.Label
FROM Song s
LEFT JOIN Genre g
ON s.GenreId = g.Id
GROUP BY GenreId, g.Label
ORDER BY COUNT(GenreId) desc;


SELECT Title, AlbumLength as 'Album Length'
FROM Album
WHERE AlbumLength = (SELECT MAX(AlbumLength) FROM Album);

SELECT 
s.Title 
AS 'Song Title', a.Title 
AS 'Album Title', SongLength 
AS 'Song Length'
FROM Song s
LEFT JOIN Album a 
ON s.AlbumId = a.Id
WHERE SongLength = (Select MAX(SongLength) 
FROM Song);