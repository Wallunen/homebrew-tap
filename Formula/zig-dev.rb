class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "30e0b9e091126148f84cf764029b27346ecabff95c91bdce72bdbfcb8efbaa8c" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "3ba572458338e00579dd0546fc57751d46d7c76d1728a1833d2818daaf9a276c" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "253ce9a38475ea0488cae72e05f9cbc7178f44da80e985c24058d7293fdc51c5" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.3340+1b8d1b18c.tar.xz"
  version "0.12.0-dev.3340+1b8d1b18c"
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
