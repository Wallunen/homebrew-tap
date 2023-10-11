class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "5afb552531127604d7f100e44eb7f60acff036a332fd924ef07b7ad5552ec6a6" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "e1b4dccf6ebe8be60e2fb4db60a60690767753fd700dcd505557fdeaeb7f2377" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "f42c2016f369926474a9f3a557721af057d91b42397881b7975530d922f64327" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.878+7abf9b3a8.tar.xz"
  version "0.12.0-dev.878+7abf9b3a8"
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
