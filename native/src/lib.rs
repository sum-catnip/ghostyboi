use std::str;

use gdnative::prelude::*;

use gdnative::api::OS;
use gdnative::api::os::HandleType;
use windows::Win32::{
    Foundation::HWND,
    Foundation::POINT,
    UI::WindowsAndMessaging,
    UI::Input::KeyboardAndMouse,
    Graphics::Gdi 
};

#[derive(NativeClass)]
#[inherit(Node)]
pub struct HelloWorld {
    window: Option<HWND>
}

#[methods]
impl HelloWorld {
    fn new(_base: &Node) -> Self {
        HelloWorld { window: None }
    }

    #[method]
    fn _ready(&mut self, #[base] _base: &Node) {
        //self.window = unsafe { Some(KeyboardAndMouse::GetActiveWindow()) };
    }

    fn window(&mut self) -> HWND {
        *self.window.get_or_insert_with(||
            HWND(OS::godot_singleton().get_native_handle(HandleType::WINDOW_HANDLE.0) as isize))
    }

    #[method]
    pub fn window_clickthrough(&mut self) {
        unsafe {
            let window = self.window();
            let style = WindowsAndMessaging::GWL_EXSTYLE;
            let old = WindowsAndMessaging::GetWindowLongA(window, style);
            WindowsAndMessaging::SetWindowLongA(
                window, style,
                WindowsAndMessaging::WS_EX_LAYERED.0 as i32 | WindowsAndMessaging::WS_EX_TRANSPARENT.0 as i32 | old);
        }
    }

    #[method]
    pub fn cursor_pos(&mut self) -> Vector2 {
        let window = self.window();
        let mut p = POINT { x: 0, y: 0 };
        unsafe {
            WindowsAndMessaging::GetCursorPos(&mut p);
            Gdi::ScreenToClient(window, &mut p);
        }
        
        Vector2 { x: p.x as f32, y: p.y as f32 }
    }
}

fn init(handle: InitHandle) {
    handle.add_class::<HelloWorld>();
}

godot_init!(init);
