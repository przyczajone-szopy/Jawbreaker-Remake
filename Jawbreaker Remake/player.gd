
extends KinematicBody2D



#pixels / second
const MOTION_SPEED = 250
var tablicaY=[62,110,158,206,254,302,350,398,446]	#Tablica rzedow, czyli wspolrzednych y
var tablicaX=[44,748]	#Tablica kolumn, czyli wspolrzednych x
var motion = Vector2()
const epsilon=3	#Maksymalna odleglosc bycia "blisko"


func  checkRow():	#Zwraca wspolrzedna y pobliskiego rzedu lub -1 jesli takowego nie ma
	for y in tablicaY:
		if abs(self.get_pos().y-y)<epsilon:
			return y
	return -1

func checkColumn():	#Zwraca wspolrzedna x pobliskiej kolumny lub -1 jesli takowej nie ma
	for x in tablicaX:
		if abs(self.get_pos().x-x)<epsilon:
			return x
	return -1

func _fixed_process(delta):

	
	if (Input.is_action_pressed("move_up")):
		var column=checkColumn()
		if column!=-1:
			self.set_pos(Vector2(column,self.get_pos().y))	#Ustawia gracza na konkretnej kolumnie
			motion=Vector2(0,-1)
	if (Input.is_action_pressed("move_bottom")):
		var column=checkColumn()
		if column!=-1:
			self.set_pos(Vector2(column,self.get_pos().y))	#Ustawia gracza na konkretnej kolumnie
			motion=Vector2(0,1)
	if (Input.is_action_pressed("move_left")):
		var row=checkRow()
		if row!=-1:
			self.set_pos(Vector2(self.get_pos().x,row))	#Ustawia gracza w konkretnym rzedzie
			motion=Vector2(-1,0)
	if (Input.is_action_pressed("move_right")):
		var row=checkRow()
		if row!=-1:
			self.set_pos(Vector2(self.get_pos().x,row))	#Ustawia gracza w konkretnym rzedzie
			motion=Vector2(1,0)
	
	var futurePos=self.get_pos()+(motion.normalized() * MOTION_SPEED * delta)	#Przewidywana nastepna pozycja
	
	if (futurePos.x>tablicaX[1]):	#Sprawdzanie, czy nastepny ruch przeniesie gracza poza mape
		self.set_pos(Vector2(tablicaX[1],self.get_pos().y))
		motion=Vector2(0,0)	#Zatrzymanie gracza
	if (futurePos.x<tablicaX[0]):
		self.set_pos(Vector2(tablicaX[0],self.get_pos().y))
		motion=Vector2(0,0)
	if(futurePos.y>tablicaY[tablicaY.size()-1]):
		self.set_pos(Vector2(self.get_pos().x,tablicaY[tablicaY.size()-1]))
		motion=Vector2(0,0)
	if(futurePos.y<tablicaY[0]):
		self.set_pos(Vector2(self.get_pos().x,tablicaY[0]))
		motion=Vector2(0,0)

	motion = motion.normalized() * MOTION_SPEED * delta
	self.move(motion)
	

func _ready():
	self.set_fixed_process(true)
	pass
