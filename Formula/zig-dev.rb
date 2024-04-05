class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "e069375bedb927eb8c282bf83eb2edda3693de1177830235db072396f1e21a03" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "632ab328577ce6243e9c479e5492f10c14a1a292a3d11d53e24cbe248c6eab98" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "ff70856b1e4e79a365a0cb97eafac80c905228b7a4ba15bcaf3da0c7e52f6be4" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3533+e5d900268.tar.xz"
  version "0.12.0-dev.3533+e5d900268"
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
