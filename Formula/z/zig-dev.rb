class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "20c83d15f6c43e8186953b0b5948d019d25fa8cc173e8e6318d741e606801d58" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "47f23ee3665dd89bc1fc6aa82d55d9bf8f1c3f684f3fa642c7a529b68780a612" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d62c0186ea47834f5f12c3536941ce80506687c76d4fadfb783f9ab23c0b21cb" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2605+136c5a916.tar.xz"
  version "0.14.0-dev.2605+136c5a916"
  license "MIT"

  livecheck do
    skip "Dynamic `url` and `sha256`"
  end

  depends_on macos: :big_sur # https://github.com/ziglang/zig/issues/13313
  depends_on "z3"
  depends_on "zstd"
  uses_from_macos "ncurses"
  uses_from_macos "zlib"

  conflicts_with "zig", because: "both install a `zig` binary"

  def install
    bin.install "zig"
    lib.install "lib" => "zig"
  end
end
