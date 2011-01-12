/**
 * @author DURAND William
 */

package ;
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.events.KeyboardEvent;
import flash.text.TextField;
import flash.events.Event;
import flash.text.TextFormat;
import flash.text.TextFormatAlign;
import flash.ui.Keyboard;
import flash.ui.Mouse;
import flash.events.MouseEvent;
import flash.filters.GlowFilter;
import haxe.Timer;

class DuckHunt 
{
	private var root : MovieClip;
	private var fond : Fond;
	private var tabCanards : Array<Canard>;
	private var points : Int;
	private var cursor : Cursor;
	private var init_time : Float;
	private var menu : Menu;
	private var timer:Timer;
	
	public function new()
	{
		root = flash.Lib.current;
		
		fond = new Fond();
		cursor = new Cursor();
		menu = new Menu(this);
		
		tabCanards = new Array<Canard>();
		for (i in 0...9)
		{
			tabCanards[i] = new Canard();
		}
		
		timer = new Timer(15000);
		init_time = Timer.stamp();
		
		points = 0;
		
		root.addChild(fond);
		root.addChild(cursor);
		root.addChild(menu.getBegin());
		root.addEventListener(MouseEvent.CLICK , launch);
	}
	
	public function launch( e:MouseEvent )
	{
		for (i in 0...9)
		{
			fond.addChild(tabCanards[i]);			
			tabCanards[i].addEventListener(MouseEvent.MOUSE_DOWN, kill);
		}
		
		root.removeChild(menu.getBegin());
		root.addChild(menu.getCurrent());
		
		root.addEventListener(Event.ENTER_FRAME, affichage);
		
		timer.run = endGame;
		
		root.removeEventListener(MouseEvent.CLICK, launch);
	}
	
	public function reload()
	{
		root.removeChild(menu.getEnd());
		root.addChild(menu.getCurrent());
		
		root.addEventListener(Event.ENTER_FRAME, affichage);
		
		points = 0;
		init_time = Timer.stamp();
		
		timer.run = endGame;
	}
	
	function endGame()
	{
		root.removeEventListener(Event.ENTER_FRAME, affichage);
		
		root.addChild(menu.getEnd());
	}
	
	function kill( e:MouseEvent )
	{		
		if(cursor.hitTestObject(e.currentTarget))
		{
			if(!e.currentTarget.killed)
			{
				points++;
				e.currentTarget.killed = true;
			}
		}
	}
	
	function affichage( e:Event )
	{
		menu.setChrono(15 - Math.round(Timer.stamp() - init_time));
		menu.setScore(points);
	}
	
	static function main() 
	{
		var jeu:DuckHunt = new DuckHunt();
	}
}