SELECT nombre FROM producto;
SELECT nombre, precio FROM producto;
SELECT * FROM producto;
SELECT nombre, precio, precio * 1.1 AS precio_usd FROM producto;
SELECT nombre AS nombre_de_producto, precio AS euros, precio* 1.1 AS dolares FROM producto;
SELECT UPPER(nombre) AS nombre, precio FROM producto;
SELECT LOWER(nombre) AS nombre, precio FROM producto;
SELECT nombre, UPPER(LEFT(nombre, 2)) AS iniciales FROM fabricante;
SELECT nombre, ROUND(precio) AS precio_redondeado FROM producto; 
SELECT nombre, TRUNCATE(precio, 0) AS precio FROM producto;
SELECT codigo_fabricante FROM producto;
SELECT DISTINCT codigo_fabricante FROM producto;
SELECT nombre FROM fabricante ORDER BY nombre ASC;
SELECT nombre FROM fabricante ORDER BY nombre DESC;
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;
SELECT * FROM fabricante ORDER BY codigo ASC LIMIT 0, 5;
SELECT * FROM fabricante ORDER BY codigo ASC LIMIT 3, 2;
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 0, 1;
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 0, 1;
SELECT nombre FROM producto WHERE codigo_fabricante = 2;
SELECT p.nombre, p.precio, f.nombre AS fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo;
SELECT p.nombre, p.precio, f.nombre AS fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY f.nombre ASC;
SELECT p.codigo, p.nombre, p.codigo_fabricante, f.nombre AS fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo;
SELECT p.nombre, p.precio, f.nombre AS fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY p.precio ASC LIMIT 1;
SELECT p.nombre, p.precio, f.nombre AS fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY p.precio DESC LIMIT 1;
SELECT p.* FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Lenovo';
SELECT p.* FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Crucial' AND p.precio > 200;
SELECT p.* FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Asus' OR f.nombre = 'Hewlett-Packard' OR f.nombre = 'Seagate';
SELECT p.* FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');
SELECT p.nombre, p.precio FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE '%e';
SELECT p.nombre, p.precio FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE '%w%';
SELECT p.nombre, p.precio, f.nombre AS fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE p.precio >= 180 ORDER BY p.precio DESC, p.nombre ASC;
SELECT p.nombre, f.nombre AS fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE p.precio BETWEEN 80 AND 300;
SELECT COUNT(*) AS total_productos FROM producto;
SELECT f.codigo, f.nombre FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante WHERE p.codigo_fabricante IS NULL;
SELECT * FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo');
SELECT * FROM producto WHERE precio >= (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'));
SELECT nombre FROM producto WHERE precio = (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'));
SELECT nombre FROM producto WHERE precio = (SELECT MIN(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Hewlett-Packard'));
SELECT * FROM producto WHERE precio >= (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'));
SELECT * FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Asus') AND precio > (SELECT AVG(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Asus'));

SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' ORDER BY apellido1, apellido2, nombre; 
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;
SELECT * FROM persona WHERE tipo =  'alumno' AND YEAR(fecha_nacimiento) = 1999;
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'profesor' AND telefono IS NULL AND nif LIKE '%K';
SELECT nombre FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;
SELECT p.apellido1, p.apellido2, p.nombre, d.nombre AS departamento FROM persona p JOIN profesor pr ON p.id = pr.id_profesor JOIN departamento d ON pr.id_departamento = d.id ORDER BY p.apellido1, p.apellido2, p.nombre;
SELECT a.nombre, c.anyo_inicio, c.anyo_fin FROM alumno_se_matricula_asignatura m JOIN asignatura a ON m.id_asignatura = a.id JOIN curso_escolar c ON m.id_curso_escolar = c.id JOIN persona p ON m.id_alumno = p.id WHERE p.nif = '26902806M';
SELECT DISTINCT d.nombre FROM departamento d JOIN profesor p ON d.id = p.id_departamento JOIN asignatura a ON p.id = a.id_profesor JOIN grado g ON a.id_grado = g.id WHERE g.nombre = 'Grado en Ingeniería Informática (Pla 2015)';
SELECT DISTINCT p.nombre, p.apellido1, p.apellido2 FROM persona p JOIN alumno_se_matricula_asignatura m ON p.id = m.id_alumno JOIN curso_escolar c ON m.id_curso_escolar = c.id WHERE c.anyo_inicio = 2018 AND c.anyo_fin = 2019;
SELECT d.nombre AS departamento, p.apellido1, p.apellido2, p.nombre FROM persona p LEFT JOIN profesor pr ON p.id = pr.id_profesor LEFT JOIN departamento d ON pr.id_departamento = d.id WHERE p.tipo = 'profesor' ORDER BY d.nombre, p.apellido1, p.apellido2, p.nombre;
SELECT p.nombre, p.apellido1, p.apellido2 FROM persona p LEFT JOIN profesor pr ON p.id = pr.id_profesor WHERE p.tipo = 'profesor' AND pr.id_departamento IS NULL;
SELECT d.nombre FROM departamento d LEFT JOIN profesor p ON d.id = p.id_departamento WHERE p.id_profesor IS NULL;
SELECT p.nombre, p.apellido1, p.apellido2 FROM persona p LEFT JOIN asignatura a ON p.id = a.id_profesor WHERE p.tipo = 'profesor' AND a.id_profesor IS NULL;
SELECT nombre FROM asignatura WHERE id_profesor IS NULL;
SELECT d.nombre FROM departamento d LEFT JOIN profesor p ON d.id = p.id_departamento LEFT JOIN asignatura a ON p.id_profesor = a.id_profesor WHERE a.id IS NULL;
SELECT COUNT(*) AS total_alumnos FROM persona WHERE tipo = 'alumno';
SELECT COUNT(*) AS alumnos_1999 FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;
SELECT d.nombre, COUNT(p.id_profesor) AS num_profesores FROM departamento d JOIN profesor p ON d.id = p.id_departamento GROUP BY d.nombre ORDER BY num_profesores DESC;
SELECT d.nombre, COUNT(p.id_profesor) AS num_profesores FROM departamento d LEFT JOIN profesor p ON d.id = p.id_departamento GROUP BY d.nombre;
SELECT g.nombre, COUNT(a.id) AS num_asignaturas FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre ORDER BY num_asignaturas DESC;
SELECT g.nombre, COUNT(a.id) AS num_asignaturas FROM grado g JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre HAVING num_asignaturas > 40;
SELECT g.nombre, a.tipo, SUM(a.creditos) AS total_creditos FROM grado g JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre, a.tipo;
SELECT c.anyo_inicio, COUNT(DISTINCT m.id_alumno) AS num_alumnos FROM curso_escolar c JOIN alumno_se_matricula_asignatura m ON c.id = m.id_curso_escolar GROUP BY c.anyo_inicio;
SELECT p.id, p.nombre, p.apellido1, p.apellido2, COUNT(a.id) AS num_asignaturas FROM persona p LEFT JOIN asignatura a ON p.id = a.id_profesor WHERE p.tipo = 'profesor' GROUP BY p.id ORDER BY num_asignaturas DESC;
SELECT * FROM persona WHERE tipo = 'alumno' ORDER BY fecha_nacimiento DESC LIMIT 1;
SELECT p.nombre, p.apellido1, p.apellido2 FROM persona p JOIN profesor pr ON p.id = pr.id_profesor LEFT JOIN asignatura a ON p.id = a.id_profesor WHERE p.tipo = 'profesor' AND a.id IS NULL;
