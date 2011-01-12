/**
 * @author DURAND William
 */

package ;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.Lib;
import flash.media.Sound;
import flash.media.SoundLoaderContext;
import flash.net.URLRequest;
import flash.ui.Mouse;

class Cursor extends Cible
{
	public function new()
	{
		super();
		
		Mouse.hide();
		
		this.addEventListener(Event.ENTER_FRAME, move);
		this.addEventListener(MouseEvent.MOUSE_DOWN, tir);
	}
	
	function tir( e:MouseEvent )
	{
		(new Sound(new URLRequest("tir.mp3"), new SoundLoaderContext(10, true))).play();
	}
	
	function move( e:Event )
	{
		this.x = root.mouseX ;
		this.y = root.mouseY ;
	}
}