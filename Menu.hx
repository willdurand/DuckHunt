/**
 * ...
 * @author DURAND William
 */

package ;
import flash.Boot;
import flash.display.Sprite;
import flash.Error;
import flash.events.MouseEvent;
import flash.events.TextEvent;
import flash.filters.GlowFilter;
import flash.Lib;
import flash.system.System;
import flash.text.TextField;
import flash.text.TextFormat;
import flash.text.TextFormatAlign;
import flash.ui.ContextMenu;

class Menu
{
	private var begin(getBegin, null) : Sprite;
	private var end(getEnd, null) : Sprite;
	private var current(getCurrent, null) : Sprite;
	private var tf_nbPoints : TextField;
	private var tf_temps : TextField;
	private var jeu : DuckHunt;
	
	public function new( jeu:DuckHunt ) 
	{
		begin = new Sprite();
		current = new Sprite();
		end = new Sprite();
	
		this.jeu = jeu;
		
		var ts:TextFormat = new TextFormat();
		ts.font = "Arial";
		ts.size = 14;
		ts.color = 0xFFFFFF;
		ts.bold = true;
		
		var t:TextFormat = new TextFormat();
		t.font = "Arial";
		t.size = 42;
		t.color = 0xFFFFFF;
		t.bold = true;
		t.align = TextFormatAlign.CENTER;
		
		var t2:TextFormat = new TextFormat();
		t2.font = "Arial";
		t2.size = 18;
		t2.color = 0xFFFFFF;
		t2.bold = true;
		t2.align = TextFormatAlign.CENTER;
		
		var tf_titre:TextField = new TextField();
		var tf_subtitre_1:TextField = new TextField();
		var tf_end:TextField = new TextField();
		var tf_end_1:TextField = new TextField();
		var tf_end_2:TextField = new TextField();
		
		tf_titre.defaultTextFormat = t;
		tf_titre.filters = [ new GlowFilter(0x000000, 1.0, 3, 3, 3, 3, false, false) ];
		tf_titre.x = 0;
		tf_titre.y = 130;
		tf_titre.width = 400;

		tf_subtitre_1.defaultTextFormat = t2;
		tf_subtitre_1.filters = [ new GlowFilter(0x000000, 1.0, 3, 3, 3, 3, false, false) ];
		tf_subtitre_1.x = 0;
		tf_subtitre_1.y = 180;
		tf_subtitre_1.width = 400;
		
		tf_end.defaultTextFormat = t;
		tf_end.filters = [ new GlowFilter(0x000000, 1.0, 3, 3, 3, 3, false, false) ];
		tf_end.x = 0;
		tf_end.y = 130;
		tf_end.width = 400;

		tf_end_1.defaultTextFormat = t2;
		tf_end_1.filters = [ new GlowFilter(0x000000, 1.0, 3, 3, 3, 3, false, false) ];
		tf_end_1.x = 0;
		tf_end_1.y = 180;
		tf_end_1.width = 400;
		tf_end_1.height = 25;
		
		tf_end_2.defaultTextFormat = t2;
		tf_end_2.filters = [ new GlowFilter(0x000000, 1.0, 3, 3, 3, 3, false, false) ];
		tf_end_2.x = 0;
		tf_end_2.y = 200;
		tf_end_2.width = 400;
		tf_end_2.height = 25;
		
		// BEGIN
		
		tf_titre.text = "Duck Hunt Like";
		tf_subtitre_1.text = "Click to start";
		
		tf_titre.mouseEnabled = false;
		tf_subtitre_1.mouseEnabled = false;
		
		begin.addChild(tf_titre);
		begin.addChild(tf_subtitre_1);
		
		// CURRENT
		tf_nbPoints = new TextField();
		tf_temps = new TextField();
		
		tf_nbPoints.mouseEnabled = false;
		tf_nbPoints.width = 200;
		tf_nbPoints.height = 20;
		tf_nbPoints.x = 5;
		tf_nbPoints.y = 375;
		tf_nbPoints.defaultTextFormat = ts;
		tf_nbPoints.filters = [ new  GlowFilter(0x000000, 1.0, 3, 3, 3, 3, false, false) ];
		
		tf_temps.mouseEnabled = false;
		tf_temps.width = 210;
		tf_temps.height = 20;
		tf_temps.x = 200;
		tf_temps.y = 375;
		tf_temps.defaultTextFormat = ts;
		tf_temps.filters = [ new  GlowFilter(0x000000, 1.0, 3, 3, 3, 3, false, false) ];
		
		current.addChild(tf_nbPoints);
		current.addChild(tf_temps);
		
		// END
		
		tf_end.text = "GAME OVER";
		tf_end.mouseEnabled = false;
		tf_end_1.text = "[ Recommencer ]";
		tf_end_1.mouseEnabled = true;
		tf_end_1.addEventListener(MouseEvent.CLICK, reload);
		tf_end_2.text = "[ Quitter ]";
		tf_end_2.mouseEnabled = true;
		tf_end_2.addEventListener(MouseEvent.CLICK, quit);
		
		end.addChild(tf_end);
		end.addChild(tf_end_1);
		end.addChild(tf_end_2);
	}
	
	function quit( e:MouseEvent )
	{
		System.exit(0);
	}
	
	function reload( e:MouseEvent )
	{
		jeu.reload();
	}
	
	public function getEnd()
	{
		return end;
	}
	
	public function getBegin()
	{
		return begin;
	}
	
	public function getCurrent()
	{
		return current;
	}
	
	public function setChrono( time:Float )
	{
		if (time == 0)
		{
			tf_temps.text = "Fin de la partie.";
		}
		else
		{
			tf_temps.text = "Temps restant: " + Std.string(time) + "s";
		}
	}
	
	public function setScore( score:Int )
	{
		tf_nbPoints.text = "Score: " + Std.string(score);
	}
}