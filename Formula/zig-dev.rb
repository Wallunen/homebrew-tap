class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "47ce763781cad0fad21969f78af20c3f3917a5368169bf3079fced4dd063b3a9" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "c552d1c3f306beac94aba2970ca65bba493c3571afb028ed96a4bf8347e51a9b" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "64b2f4a40656c58d17c765ddb748b2d7fb9ff7b132fda389abc85a9276f9d75c" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.1520+be14fe1fa.tar.xz"
  version "0.12.0-dev.1520+be14fe1fa"
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
