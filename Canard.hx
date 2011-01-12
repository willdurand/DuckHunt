/**
 * @author DURAND William
 */

package ;
import flash.display.Sprite;
import flash.events.Event;
import flash.Lib;

class Canard extends Sprite
{
	private var killed(default, default) : Bool;
	private var vitesse : Int;
	private var size : Float;
	private var vivant : Sprite;
	private var vivant1 : Sprite;
	private var vivant2 : Sprite;
	private var refresh : Int;
	private var mort : Sprite;
	private var i : Float;
	private var init_height : Float;
	private var init_width : Float;
	
	public function new() 
	{
		super();
		
		vivant = new Sprite();
		vivant1 = new CanardVivant();
		vivant2 = new CanardVivantUp();
		mort = new CanardMort();
		
		init_height = vivant1.height;
		init_width = vivant1.width;
		
		vivant.addChild(vivant1);
		addChild(vivant);
		
		init(this);
		
		this.addEventListener(Event.ENTER_FRAME, vole);
		//this.getChildAt(0).addEventListener(Event.ENTER_FRAME, oscille);
	}
		
	function init( object:Dynamic )
	{
		killed = false;
		
		i = Math.random() * 100;
		refresh = Math.floor(Math.random() * 8);
		vitesse = Math.floor(Math.random() * 5) + 2;
		size = vitesse / 4;

		if (size < 0.8)
			size = 0.8;

		object.width = object.init_width * size <= object.init_width ? object.init_width * size : object.init_width;
		object.height = object.init_height * size <= object.init_height ? object.init_height * size : object.init_height;
		object.y = 30 * (Math.random() * 10);
		object.x = Math.floor(Math.random() * 100) * 5 + Lib.current.stage.stageWidth;
	
		if(object.contains(mort))
		{
			object.removeChild(mort);
			object.addChild(vivant);
		}
	}
	
	function oscille( e:Event )
	{
		i += 0.1;
		
		e.currentTarget.y = Math.sin(i) + e.currentTarget.y;
	}
	
	function vole( e:Event )
	{
		refresh++;
		if (refresh >= ((1/this.vitesse) * 5 + 3))
		{
			if (vivant.contains(vivant1))
			{
				vivant.removeChild(vivant1);
				vivant.addChild(vivant2);
			}
			else
			{
				vivant.removeChild(vivant2);
				vivant.addChild(vivant1);
			}
			
			refresh = 0;
		}
		
		if (e.currentTarget.killed)
		{
			if (this.contains(vivant))
			{
				this.removeChild(vivant);
				this.addChild(mort);
			}
			
			e.currentTarget.y += 10;
			
			if (e.currentTarget.y > 400)
			{
				init(e.currentTarget);
			}
		}
		else
		{
			e.currentTarget.x -= vitesse;

			if (e.currentTarget.x < -50)
			{
				init(e.currentTarget);
			}
		}
	}
}
